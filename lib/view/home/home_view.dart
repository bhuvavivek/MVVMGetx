import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmwithget/view_model/controllers/home/home_controllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Home Screen')),
    );
  }
}
