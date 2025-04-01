import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings.dart';


class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({super.key});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  // Load the theme preference from shared preferences
  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  // Save the theme preference to shared preferences
  Future<void> _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

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
        title: const Text('Appearance'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ListTile(
          title: const Text('Dark Mode'),
          trailing: Switch(
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });
              _saveThemePreference(value);
              // Change theme immediately
              if (_isDarkMode) {
                _setDarkTheme();
              } else {
                _setLightTheme();
              }
            },
          ),
        ),
      ),
    );
  }

  // Method to set the dark theme
  void _setDarkTheme() {
    ThemeData darkTheme = ThemeData.dark();
    // Apply dark theme
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
  }

  // Method to set the light theme
  void _setLightTheme() {
    ThemeData lightTheme = ThemeData.light();
    // Apply light theme
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
  }
}
