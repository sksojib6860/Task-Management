import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'asset_paths.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      SvgPaths.backgroundImg,
      width: double.maxFinite,
      height: double.maxFinite,
      fit: BoxFit.cover,
    );
  }
}
