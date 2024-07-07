import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/back.jpg',
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
