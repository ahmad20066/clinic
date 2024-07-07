import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const TitleWidget(
      {Key? key, required this.text, this.size = 35, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.sp),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'ChivoMono',
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: size),
      ),
    );
  }
}
