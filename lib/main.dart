import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/get_started.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const GetMaterialApp(
        home: GetStarted(),
      ),
    );
  }
}
