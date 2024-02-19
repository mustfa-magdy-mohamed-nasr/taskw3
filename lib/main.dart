import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskw3/login/lodin_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: LoginView(),
    );
  }
}
