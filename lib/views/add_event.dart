import 'package:flutter/material.dart';

class AddEvent_Page extends StatelessWidget {
  const AddEvent_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
