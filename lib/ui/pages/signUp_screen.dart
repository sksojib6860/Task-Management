import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/pages/signIn_screen.dart';
import 'package:task_manager_app/utils/sceen_background.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static String name = '/sign-up';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                'Join with us',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              TextField(decoration: InputDecoration(hintText: 'Email')),
              TextField(decoration: InputDecoration(hintText: 'First Name')),
              TextField(decoration: InputDecoration(hintText: 'Last Name')),
              TextField(decoration: InputDecoration(hintText: 'Mobile Number')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: onTapSignIn,
                child: Icon(Icons.arrow_circle_right_outlined),
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
                        recognizer: TapGestureRecognizer()..onTap = onTapSignIn,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapForgotPassword() {}

  void onTapSignUp() {}

  void onTapSignIn() {
    Navigator.pushNamed(context, SigninScreen.name);
  }
}
