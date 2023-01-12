import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';
import '../screens/home.dart';
import '../model/globals.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Cold calculation';
    darkMode = SystemTheme.isDarkMode;
    final ValueNotifier<ThemeMode> notifier =
        ValueNotifier(darkMode ? ThemeMode.dark : ThemeMode.light);

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          themeMode: mode,
          darkTheme: ThemeData(
            drawerTheme: const DrawerThemeData(
              scrimColor: Colors.black54,
              backgroundColor: Colors.black12,
            ),
            scaffoldBackgroundColor: Colors.black12,
            colorScheme: ColorScheme.fromSwatch(
              cardColor: Colors.teal[400],
              primarySwatch: Colors.teal,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          theme: ThemeData(
            drawerTheme: DrawerThemeData(
              scrimColor: Colors.black54,
              backgroundColor: Colors.teal[100],
            ),
            scaffoldBackgroundColor: Colors.teal[100],
            colorScheme: ColorScheme.fromSwatch(
              cardColor: Colors.white70,
              primarySwatch: Colors.teal,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          title: appTitle,
          home: MyHomePage(
            title: appTitle,
            notifier: notifier,
            mode: mode,
          ),
        );
      },
    );
  }
}
