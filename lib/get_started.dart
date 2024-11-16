import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:get/get.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text(
                'P',
                style: TextStyle(fontSize: 99, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              'Plant your self',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              'Organize your time more efficiently',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(Login_page());
            },
            child: Text('Get Started'),
          )
        ],
      ),
    );
  }
}
