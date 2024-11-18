import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppointmentController extends GetxController {
  // List to hold the saved appointments
  var appointments = <Map<String, String>>[].obs;

  // Observable fields for the form inputs
  var title = ''.obs;
  var date = ''.obs;
  var time = ''.obs;

  // TextEditingController for form fields
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void saveAppointment() {
    if (titleController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty) {
      // Add a new appointment to the list
      appointments.add({
        'title': titleController.text,
        'date': dateController.text,
        'time': timeController.text,
      });

      // Print to console for verification
      print(
          "Appointment saved: Title - ${titleController.text}, Date - ${dateController.text}, Time - ${timeController.text}");

      // Show a success snackbar
      Get.snackbar('Success', 'Appointment saved successfully');

      // Clear input fields after saving
      clearFields();
    } else {
      // Show an error snackbar if fields are empty
      Get.snackbar('Error', 'Please fill in all fields');
    }
  }

  // Method to get appointments for a specific day
  List<String> getAppointmentsForDay(DateTime day) {
    String dayString = day.toString().split(' ')[0]; // Format as 'yyyy-MM-dd'
    return appointments
        .where((appointment) => appointment['date'] == dayString)
        .map((appointment) => appointment['title'] ?? 'No title')
        .toList();
  }

  void clearFields() {
    titleController.clear();
    dateController.clear();
    timeController.clear();
    title.value = '';
    date.value = '';
    time.value = '';
  }
}
