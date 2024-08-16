import 'package:clinic/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  Function(String)? onChanged;
  CustomSearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.primaryColor,
          blurRadius: 6,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),
            border: InputBorder.none,
            hintText: "Search",
            contentPadding: EdgeInsets.only(left: 20.w, top: 15.h)),
      ),
    );
  }
}
