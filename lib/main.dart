import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'utils/task.dart';
import 'utils/task_dialog.dart';
import 'pages/settings.dart';
 import 'pages/progress.dart';
import 'pages/appearance.dart';

// FIX PROGRESS.dart file so progress page will work
// FIX appearance.dart file for light and dark theme

void main() {
  runApp(const HabitTrackerApp());

  initializeDateFormatting().then((_) => runApp(const HabitTrackerApp()));
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker App',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.system, // System-wide theme mode
      home: const HomeScreen(title: 'Habit Tracker App'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(title: 'Water plant', reminderTime: DateTime.now()),
    Task(title: 'Finish MAD project 1 proposal', reminderTime: DateTime.now().add(Duration(hours: 2))),
    Task(title: 'Fold laundry', reminderTime: DateTime.now().add(Duration(hours: 4))),
  ];

  int _selectedIndex = 0; // selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

   
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProgressScreen(taskCompletionCount: {},)),
      );
    }

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()),
      );
    }
  }


  void _addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _editTask(int index, Task task) {
    setState(() {
      tasks[index] = task;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  double _calculateProgress() {
    if (tasks.isEmpty) return 0.0;
    int completedTasks = tasks.where((task) => task.isCompleted).length;
    return completedTasks / tasks.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Weekly Calendar
          TableCalendar(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.week,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                // Update the state based on the selected day
              });
            },
          ),
          
          // Today's To-Do List
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: tasks[index].isCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        tasks[index].isCompleted = value ?? false;
                      });
                    },
                  ),
                  title: Text(tasks[index].title),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => TaskDialog(
                              task: tasks[index],
                              onSave: (task) {
                                _editTask(index, task);
                              },
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteTask(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          
          // Daily Progress Bar Tracker
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: _calculateProgress(),
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
              minHeight: 10,
            ),
          ),
          Text('Daily Progress: ${(_calculateProgress() * 100).toStringAsFixed(0)}%'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => TaskDialog(
              onSave: (task) {
                _addTask(task);
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
