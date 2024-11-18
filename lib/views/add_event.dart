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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (value) => controller.title.value = value,
            ),
            TextField(
              controller: controller.dateController,
              decoration: InputDecoration(labelText: 'Date'),
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
            TextField(
              controller: controller.timeController,
              decoration: InputDecoration(labelText: 'Time'),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.saveAppointment,
              child: Text('Save Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
