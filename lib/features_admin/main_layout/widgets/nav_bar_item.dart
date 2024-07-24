import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../common/constants/app_colors.dart';

class NavBarItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final double iconHeight;
  final bool isSvg;
  final String? svgImage;
  final double? svgHeight;
  const NavBarItem(
      {super.key,
      this.icon,
      required this.title,
      required this.isSelected,
      required this.onTap,
      this.iconHeight = 25,
      this.isSvg = false,
      this.svgImage,
      this.svgHeight = 30});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            isSvg
                ? SvgPicture.asset(
                    svgImage!,
                    height: svgHeight!.h,
                    color: isSelected
                        ? AppColors.primaryColor
                        : const Color.fromRGBO(154, 170, 180, 1),
                  )
                : Icon(
                    icon,
                    color: isSelected
                        ? AppColors.primaryColor
                        : const Color.fromRGBO(154, 170, 180, 1),
                    size: 30.sp,
                  ),
            SizedBox(
              height: 5.h,
            ),
            Flexible(
              child: Text(
                title.tr,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      letterSpacing: 0,
                      fontFamily: 'Cairo',
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w400,
                      fontSize: 14.sp,
                      color: isSelected
                          ? AppColors.primaryColor
                          : Color.fromARGB(255, 187, 187, 187),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
