import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/add_event.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar_Page extends StatelessWidget {
  const Calendar_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 196, 117)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Text("back")),
                          Expanded(child: SizedBox()),
                          GestureDetector(
                              onTap: () {
                                Get.to(AddEvent_Page());
                              },
                              child: Text("Add_event")),
                          Expanded(child: SizedBox())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SfCalendar(
              view: CalendarView.month,
              initialSelectedDate: DateTime.now(),
              cellBorderColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
