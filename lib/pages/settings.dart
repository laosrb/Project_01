import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Settings'), //
        backgroundColor: Colors.white,  
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Divider(
               height: 20,
              thickness: 1,
             ),
            ListTile(
              leading: Icon(
                Icons.notifications_none),
                title: Text('Notifications'),
              ),
                Divider(
               height: 20,
              thickness: 1,
             ),
             ListTile(
              leading: Icon(
                Icons.brush),
                title: Text('Appearance'),
              ),
             Divider(
               height: 20,
              thickness: 1,
             ),
             ListTile(
              leading: Icon(
                Icons.lock),
                title: Text('Help & Support'),
              ),
          ]
        )
      ),
    );
  }
}
