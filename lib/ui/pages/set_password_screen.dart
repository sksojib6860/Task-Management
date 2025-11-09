import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/pages/signIn_screen.dart';
import 'package:task_manager_app/utils/sceen_background.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});
  static String name = '/set-password';

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
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
                'Set Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'A 6 digits verification OTP will sent to your email address.',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 8),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              TextField(
                decoration: InputDecoration(hintText: 'Confirm Password'),
              ),

              const SizedBox(height: 8),
              FilledButton(onPressed: onTapSignIn, child: Text('Confirm')),
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
    Navigator.pushNamedAndRemoveUntil(
      context,
      SigninScreen.name,
      (predicate) => false,
    );
  }
}
