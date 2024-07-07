import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTransition extends CustomTransition {
  final bool isRtl;

  MyTransition({this.isRtl = false});

  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 0.0),
            end: isRtl ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0),
          ).animate(animation),
          child: child,
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: isRtl ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ],
    );
  }
}
