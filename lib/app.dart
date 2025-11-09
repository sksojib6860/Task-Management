import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/pages/add_new_task_screen.dart';
import 'package:task_manager_app/ui/pages/forgot_password.dart';
import 'package:task_manager_app/ui/pages/otp_verification_screen.dart';
import 'package:task_manager_app/ui/pages/set_password_screen.dart';
import 'package:task_manager_app/ui/pages/signUp_screen.dart';
import 'package:task_manager_app/ui/pages/top_nav_bar_screen.dart';

import 'ui/pages/signIn_screen.dart';
import 'ui/pages/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        inputDecorationTheme: InputDecorationThemeData(
          contentPadding: EdgeInsets.symmetric(vertical: 16),
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textTheme: TextTheme(
          titleSmall: TextStyle(fontSize: 12, color: Colors.grey),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(color: Colors.green),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      initialRoute: SplashScreen.name,
      routes: <String, WidgetBuilder>{
        SplashScreen.name: (context) => SplashScreen(),
        SigninScreen.name: (context) => SigninScreen(),
        SignupScreen.name: (context) => SignupScreen(),
        ForgotPasswordScreen.name: (context) => ForgotPasswordScreen(),
        OtpVerificationScreen.name: (context) => OtpVerificationScreen(),
        SetPassword.name: (context) => SetPassword(),
        NavigationBarScreen.name: (context) => NavigationBarScreen(),
        AddNewTaskScreen.name: (context) => AddNewTaskScreen(),
      },
    );
  }
}
