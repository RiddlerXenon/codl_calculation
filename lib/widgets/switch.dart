import 'package:flutter/material.dart';
import '../model/globals.dart';

class SwitchDarkMode extends StatefulWidget {
  const SwitchDarkMode({super.key, required this.notifier, required this.mode});

  final ThemeMode mode;
  final ValueNotifier<ThemeMode> notifier;

  @override
  SwitchDarkModeClass createState() => SwitchDarkModeClass();
}

class SwitchDarkModeClass extends State<SwitchDarkMode> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: darkMode,
      onChanged: (bool value) {
        setState(() {
          widget.notifier.value =
              widget.mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
          darkMode = value;
        });
      },
    );
  }
}
