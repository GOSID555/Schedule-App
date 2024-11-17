import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/calendar.dart';
import 'package:get/get.dart';

class Dashboard_Page extends StatelessWidget {
  const Dashboard_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 40,
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "NOVEMBER",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(Calendar_Page());
                        },
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 32,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Events",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}
