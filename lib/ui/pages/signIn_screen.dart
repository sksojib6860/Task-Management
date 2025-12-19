import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/api/models/user_model.dart';
import 'package:task_manager_app/api/service/network_caller.dart';
import 'package:task_manager_app/api/utils/urls.dart';
import 'package:task_manager_app/ui/controllers/auth_controller.dart';
import 'package:task_manager_app/ui/pages/forgot_password.dart';
import 'package:task_manager_app/ui/pages/signUp_screen.dart';
import 'package:task_manager_app/ui/pages/top_nav_bar_screen.dart';
import 'package:task_manager_app/ui/widgets/sceen_background.dart';
import 'package:task_manager_app/ui/widgets/show_snack_bar.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  static String name = '/sign-in';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailctr = TextEditingController();
  final TextEditingController _passwardctr = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _signInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
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
                  'Get Started With',
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
                  controller: _emailctr,
                  decoration: InputDecoration(hintText: 'Email'),
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
                  controller: _passwardctr,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 8),
                Visibility(
                  visible: _signInProgress == false,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: FilledButton(
                    onPressed: onTapSignIn,
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: onTapForgotPassword,
                        child: Text(
                          'Forget Password',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: Theme.of(context).textTheme.bodyLarge,
                              recognizer: TapGestureRecognizer()
                                ..onTap = onTapSignUp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapSignUp() {
    Navigator.pushNamed(context, SignupScreen.name);
  }

  void onTapForgotPassword() {
    Navigator.pushNamed(context, ForgotPasswordScreen.name);
  }

  void onTapSignIn() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  Future<void> _signIn() async {
    _signInProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "email": _emailctr.text.trim(),
      "password": _passwardctr.text,
    };

    final NetworkResponse response = await NetworkClient.postRequest(
      Urls.loginUrl,
      body: requestBody,
    );
    if (response.isSuccess) {
      UserModel userModel = UserModel.fromJson(response.body['data']);
      String accessToken = response.body['token'];
      await AuthController.saveUserData(accessToken, userModel);
      Navigator.pushNamedAndRemoveUntil(
        context,
        NavigationBarScreen.name,
        (predicate) => false,
      );
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
  }
}
