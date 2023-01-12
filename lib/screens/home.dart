import 'package:flutter/material.dart';
import '../screens/aphinn.dart';
import '../widgets/drawer.dart';
import 'vigenere.dart';
import 'atbash.dart';
import 'caesar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.title,
      required this.notifier,
      required this.mode});

  final ThemeMode mode;
  final ValueNotifier<ThemeMode> notifier;
  final String title;

  @override
  Shiphr createState() => Shiphr();
}

class Shiphr extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      drawer: DraweX(notifier: widget.notifier, mode: widget.mode),
      body: ListView(
        padding: const EdgeInsets.all(3),
        children: <Widget>[
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () => Navigator.push(context, AtbashPage()),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              elevation: 0,
              child: const SizedBox(
                height: 130,
                child: Center(
                  child: Text(
                    "«Шифр Атбаш»",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () => Navigator.push(context, CaesarPage()),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(10),
              elevation: 0,
              child: const SizedBox(
                height: 130,
                child: Center(
                  child: Text(
                    "«Шифр Цезаря»",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () => Navigator.push(context, VigenerePage()),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              elevation: 0,
              child: const SizedBox(
                height: 130,
                child: Center(
                  child: Text(
                    "«Шифр Виженера»",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () => Navigator.push(context, AphinnPage()),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              elevation: 0,
              child: const SizedBox(
                height: 130,
                child: Center(
                  child: Text(
                    "«Афинный шифр»",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
