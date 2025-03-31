import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'task.dart';

class ProgressPage extends StatelessWidget {
  final List<Task> tasks;

  ProgressPage({required this.tasks});

  int _getCompletedTasksCount(DateTime day) {
    return tasks.where((task) => task.isCompleted && task.reminderTime.day == day.day).length;
  }

  List<charts.Series<ProgressData, String>> _createChartData() {
    List<ProgressData> data = [];
    for (int i = 1; i <= DateTime.now().day; i++) {
      int completedTasks = _getCompletedTasksCount(DateTime(DateTime.now().year, DateTime.now().month, i));
      data.add(ProgressData(day: i.toString(), percentage: completedTasks / tasks.length * 100));
    }

    return [
      charts.Series<ProgressData, String>(
        id: 'Daily Completion',
        domainFn: (ProgressData progress, _) => progress.day,
        measureFn: (ProgressData progress, _) => progress.percentage,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Tracker'),
      ),
      body: Column(
        children: [
          // Monthly Calendar
          TableCalendar(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.month,
            onDaySelected: (selectedDay, focusedDay) {
              // Update the state based on the selected day
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                int completedTasks = _getCompletedTasksCount(date);
                return completedTasks > 0
                    ? Positioned(
                        right: 1,
                        bottom: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          width: 16,
                          height: 16,
                          child: Center(
                            child: Text(
                              completedTasks.toString(),
                              style: TextStyle().copyWith(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container();
              },
            ),
          ),
          
          // Chart of Percentage of Monthly Daily Completion
          Expanded(
            child: charts.BarChart(
              _createChartData(),
              animate: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressData {
  final String day;
  final double percentage;

  ProgressData({required this.day, required this.percentage});
}