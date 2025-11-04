import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/asset_paths.dart';

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
      body: Center(
        child: SvgPicture.asset(
          SvgPaths.backgroundImg,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
