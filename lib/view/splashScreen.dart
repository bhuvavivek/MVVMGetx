import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmwithget/view_model/services/splas_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    super.initState();

    // neviage to the homescreen after a delay
    splashService.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
