import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/api/service/network_caller.dart';
import 'package:task_manager_app/api/utils/urls.dart';
import 'package:task_manager_app/ui/pages/signIn_screen.dart';
import 'package:task_manager_app/ui/widgets/sceen_background.dart';
import 'package:task_manager_app/ui/widgets/show_snack_bar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static String name = '/sign-up';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _inProgressIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'Join with us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Email is required';
                      }
                      if (EmailValidator.validate(value!) == false) {
                        return 'Enter your valid email address';
                      }
                      return null;
                    },
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'First Name is required';
                      }
                      return null;
                    },
                    controller: _firstNameTEController,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Last Name is required';
                      }
                      return null;
                    },
                    controller: _lastNameTEController,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Mobile Number is required';
                      }
                      return null;
                    },
                    controller: _mobileTEController,
                    decoration: InputDecoration(hintText: 'Mobile Number'),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Password is required';
                      }
                      if (value!.length < 6) {
                        return "Password can't be less than 6 characters";
                      }
                      return null;
                    },
                    controller: _passwordTEController,
                    decoration: InputDecoration(hintText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: _inProgressIndicator ? null : onTapSignUp,
                    child: _inProgressIndicator
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Have account? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context).textTheme.bodyLarge,
                            recognizer: TapGestureRecognizer()
                              ..onTap = onTapSignIn,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTapSignIn() {
    Navigator.pushNamed(context, SigninScreen.name);
  }

  void onTapSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await _signup();
    if (success) {
      Navigator.pushNamed(context, SigninScreen.name);
    }
  }

  Future<bool> _signup() async {
    setState(() {
      _inProgressIndicator = true;
    });

    try {
      Map<String, dynamic> requestBody = {
        "email": _emailTEController.text.trim(),
        "firstName": _firstNameTEController.text.trim(),
        "lastName": _lastNameTEController.text.trim(),
        "mobile": _mobileTEController.text.trim(),
        "password": _passwordTEController.text,
      };

      NetworkResponse response = await NetworkClient.postRequest(
        Urls.registrationUrl,
        body: requestBody,
      );

      if (response.isSuccess) {
        showSnackBarMessage(context, 'Registration successful! Try to Sign In');
        return true;
      } else {
        showSnackBarMessage(context, response.errorMessage);
        return false;
      }
    } catch (e) {
      showSnackBarMessage(context, 'An error occurred. Please try again.');
      return false;
    } finally {
      setState(() {
        _inProgressIndicator = false;
      });
    }
  }
}
