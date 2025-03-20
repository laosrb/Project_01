import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Task 1'),
                  trailing: IconButton(
                    icon: Icon(Icons.done),
                    onPressed: () {
                      // Mark task as done
                    },
                  ),
                ),
                ListTile(
                  title: Text('Task 2'),
                  trailing: IconButton(
                    icon: Icon(Icons.done),
                    onPressed: () {
                      // Mark task as done
                    },
                  ),
                ),
                // Add more tasks here
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add new task
            },
            child: Text('Add Task'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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