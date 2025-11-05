import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/pages/otp_verification_screen.dart';
import 'package:task_manager_app/utils/sceen_background.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static String name = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                'Your Email Address',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'A 6 digits verification OTP will sent to your email address.',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 8),
              TextField(decoration: InputDecoration(hintText: 'Email')),
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

  void onTapSignIn() {
    Navigator.pushNamed(context, OtpVerificationScreen.name);
  }
}
