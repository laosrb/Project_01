
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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

