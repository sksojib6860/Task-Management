import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_app/ui/pages/reset_password.dart';
import 'package:task_manager_app/utils/sceen_background.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  static String name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
                'OTP Verification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'A 6 digits verification OTP will sent to your email address.',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 8),
              PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: Colors.white,
                  selectedFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.white,
                enableActiveFill: true,
              ),

              const SizedBox(height: 8),
              FilledButton(onPressed: onTapSignIn, child: Text('Verify')),
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

  void onTapSignUp() {}

  void onTapSignIn() {
    Navigator.pushNamed(context, ResetPassword.name);
  }
}
