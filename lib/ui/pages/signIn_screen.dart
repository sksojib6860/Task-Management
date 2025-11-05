import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/pages/forgot_password.dart';
import 'package:task_manager_app/ui/pages/signUp_screen.dart';
import 'package:task_manager_app/utils/sceen_background.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  static String name = '/sign-in';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
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
              TextField(decoration: InputDecoration(hintText: 'Email')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: onTapSignIn,
                child: Icon(Icons.arrow_circle_right_outlined),
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
    );
  }

  void onTapForgotPassword() {
    Navigator.pushNamed(context, ForgotPasswordScreen.name);
  }

  void onTapSignUp() {
    Navigator.pushNamed(context, SignupScreen.name);
  }

  void onTapSignIn() {}
}
