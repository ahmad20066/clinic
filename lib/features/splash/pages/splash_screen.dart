import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/routers/app_router.dart';
import 'package:clinic/features/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold();
  }
}
