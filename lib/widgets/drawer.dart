import 'package:cold_calculation/model/globals.dart';
import 'package:flutter/material.dart';
import 'switch.dart';

class DraweX extends StatefulWidget {
  const DraweX({super.key, required this.notifier, required this.mode});

  final ThemeMode mode;
  final ValueNotifier<ThemeMode> notifier;

  @override
  DrawerXClass createState() => DrawerXClass();
}

class DrawerXClass extends State<DraweX> {
  var drawerHeader = DrawerHeader(
    decoration: BoxDecoration(
      color: darkMode ? Colors.teal[400] : Colors.white70,
    ),
    child: Row(
      children: [
        Image.asset(
          'res/images/dart-anime.png',
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Welcome to"),
            Text("Cold calculation"),
          ],
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          drawerHeader,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: darkMode ? Colors.teal[400] : Colors.white70,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: const Text("Settings"),
              onTap: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: darkMode ? Colors.teal[400] : Colors.white70,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: const Text("About"),
              onTap: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchDarkMode(
                notifier: widget.notifier,
                mode: widget.mode,
              )
            ],
          ),
        ],
      ),
    );
  }
}
