import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/pages/signIn_screen.dart';
import 'package:task_manager/utils/asset_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String name = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> moveNextScreen() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushNamed(context, SigninScreen.name);
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
      body: Stack(
        children: [
          SvgPicture.asset(
            SvgPaths.backgroundImg,
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Center(child: SvgPicture.asset(SvgPaths.logoSvg)),
        ],
      ),
    );
  }
}
