import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/appointment_controller.dart';
import 'add_event.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AppointmentController controller = Get.find<AppointmentController>();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments Dashboard'),
      ),
      body: Column(
        children: [
          // Calendar widget at the top
          TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: _calendarFormat,
            eventLoader: (day) {
              return controller.getAppointmentsForDay(day);
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: CalendarStyle(
              markersMaxCount: 1, // Adjust how many markers to show per day
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.red, // Color for days with appointments
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.appointments.isEmpty) {
                return Center(child: Text('No appointments yet.'));
              } else {
                // Filter appointments by selected date
                var filteredAppointments =
                    controller.appointments.where((appointment) {
                  return appointment['date'] ==
                      _selectedDay.toString().split(' ')[0];
                }).toList();

                if (filteredAppointments.isEmpty) {
                  return Center(child: Text('No appointments for this day.'));
                }

                return ListView.builder(
                  itemCount: filteredAppointments.length,
                  itemBuilder: (context, index) {
                    final appointment = filteredAppointments[index];
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(appointment['title'] ?? ''),
                        subtitle: Text(
                          'Date: ${appointment['date'] ?? ''} | Time: ${appointment['time'] ?? ''}',
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddAppointmentScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
