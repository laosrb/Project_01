import 'package:flutter/material.dart';
import 'appearance.dart'; // Import the appearance.dart file

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Automatically adjusts to the theme
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Divider(height: 20, thickness: 1),
            ListTile(
              leading: const Icon(Icons.notifications_none),
              title: const Text('Notifications'),
            ),
            Divider(height: 20, thickness: 1),
            ListTile(
              leading: const Icon(Icons.brush),
              title: const Text('Appearance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppearanceScreen(),
                  ),
                );
              },
            ),
            Divider(height: 20, thickness: 1),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Help & Support'),
            ),
          ],
        ),
      ),
    );
  }
}
