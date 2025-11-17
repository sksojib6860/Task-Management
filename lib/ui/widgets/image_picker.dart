import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key, this.textTheme});

  final TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      height: 50,
      width: double.maxFinite,
      child: Row(
        spacing: 10,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            height: 50,
            width: 100,
            child: Text('Photos'),
          ),
          Expanded(child: Text('Chose Photos', style: textTheme?.titleSmall)),
        ],
      ),
    );
  }
}
