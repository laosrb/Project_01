import 'package:flutter/material.dart';

class AppearanceScreen extends StatefulWidget {
  final ValueChanged<ThemeMode> onThemeChanged;

  const AppearanceScreen({super.key, required this.onThemeChanged});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  ThemeMode _currentThemeMode = ThemeMode.light; // Default theme mode is light

  void _updateTheme(ThemeMode themeMode) {
    setState(() {
      _currentThemeMode = themeMode;
    });
    widget.onThemeChanged(themeMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appearance Settings"),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Light Theme'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.light,
              groupValue: _currentThemeMode,
              onChanged: (value) {
                if (value != null) _updateTheme(value);
              },
            ),
          ),
          ListTile(
            title: const Text('Dark Theme'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: _currentThemeMode,
              onChanged: (value) {
                if (value != null) _updateTheme(value);
              },
            ),
          ),
          ListTile(
            title: const Text('System Default'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.system,
              groupValue: _currentThemeMode,
              onChanged: (value) {
                if (value != null) _updateTheme(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
