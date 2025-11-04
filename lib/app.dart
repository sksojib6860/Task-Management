import 'package:flutter/material.dart';

import 'ui/pages/signIn_screen.dart';
import 'ui/pages/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SplashScreen(),
      initialRoute: SplashScreen.name,
      routes: <String, WidgetBuilder>{
        SplashScreen.name: (context) => SplashScreen(),
        SigninScreen.name: (context) => SigninScreen(),
      },
    );
  }
}
