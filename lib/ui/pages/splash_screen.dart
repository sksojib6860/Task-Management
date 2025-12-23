import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_app/ui/controllers/auth_controller.dart';
import 'package:task_manager_app/ui/pages/top_nav_bar_screen.dart';
import 'package:task_manager_app/ui/widgets/sceen_background.dart';

import '../../utils/asset_paths.dart';
import 'signIn_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String name = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> moveNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    bool isLoggedIn = await AuthController.isUserAlreadyLoggedIn();
    if (isLoggedIn) {
      await AuthController.getUserData();

      Navigator.pushNamedAndRemoveUntil(
        context,
        NavigationBarScreen.name,
        (predicate) => false,
      );
    } else {
      Navigator.pushNamed(context, SigninScreen.name);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(child: SvgPicture.asset(SvgPaths.logoSvg)),
      ),
    );
  }
}
