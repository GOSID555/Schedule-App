import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  // Observable counter variable
  var counter = 0.obs;

  // Method to increment counter
  void incrementCounter() {
    counter++;
  }

  // Method to reset counter
  void resetCounter() {
    counter.value = 0;
  }
}

class GestureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the Controller
    final CounterController controller = Get.put(CounterController());

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Call the controller method on tap
              controller.incrementCounter();
            },
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              child: Obx(
                () => Text(
                  "Counter: ${controller.counter}",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Call the reset method in the controller
              controller.resetCounter();
            },
            child: Text("Cancel / Reset"),
          ),
        ],
      ),
    );
  }
}
