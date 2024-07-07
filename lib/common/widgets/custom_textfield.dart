import 'package:clinic/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController textController;
  String labelText;
  bool isPrivate;
  double pMargin, hmargin;
  IconData? preIcon;
  TextInputType? type;
  bool isLarge;
  double? width;
  TextInputAction action;

  CustomTextField(
      {super.key,
      required this.textController,
      required this.labelText,
      required this.pMargin,
      required this.hmargin,
      this.isPrivate = false,
      this.type,
      this.isLarge = false,
      this.action = TextInputAction.next,
      this.width,
      this.preIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: isLarge ? 100.h : null,
      margin: EdgeInsets.symmetric(horizontal: hmargin, vertical: pMargin),
      child: TextFormField(
          keyboardType: type,
          obscureText: isLarge ? false : isPrivate,
          controller: textController,
          maxLines: isLarge ? 10 : 1,
          textInputAction: action,
          decoration: InputDecoration(
            prefixIcon: preIcon == null
                ? null
                : Icon(
                    preIcon,
                    color: AppColors.primaryColor,
                  ),
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 5),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black38),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10)),
            hintText: labelText,
            hintStyle:
                TextStyle(color: AppColors.primaryColor, fontSize: 15.sp),
          )),
    );
  }
}
