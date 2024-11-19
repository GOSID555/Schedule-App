import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/appointment_controller.dart';

class AddAppointmentScreen extends StatelessWidget {
  final AppointmentController controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Appointment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: controller.titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: Colors.grey), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (value) => controller.title.value = value,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.descriptionController,
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'Descriptions',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: Colors.grey), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),
                onChanged: (value) => controller.des.value = value,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: Colors.grey), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (value) => controller.date.value = value,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    controller.date.value = pickedDate.toString().split(' ')[0];
                    controller.dateController.text = controller.date.value;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.timeController,
                decoration: InputDecoration(
                  labelText: 'Time',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: Colors.grey), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                ),
                onChanged: (value) => controller.time.value = value,
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    controller.time.value = pickedTime.format(context);
                    controller.timeController.text = controller.time.value;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text('Cancel',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.saveAppointment();
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 55, 64, 146),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
