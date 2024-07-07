import 'package:animated_background/animated_background.dart';
import 'package:clinic/features/auth/widgets/title_widget.dart';
import 'package:clinic/features/auth/widgets/welcome/two_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class  WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     print("aaaa");
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/back.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(),
              TitleWidget(text: 'EVERYTHING YOU IMAGINE IS REAL'),
              SizedBox(
                height: 15.h,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment(-0.5, 1),
                child: Container(
                  width: 270.w,
                  child: Text(
                    'Make your life easier by using our application',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const Spacer(),
              const Align(
                  alignment: Alignment.topCenter, child: TwoButtonWidget()),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}