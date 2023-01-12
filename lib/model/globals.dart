import 'package:flutter/material.dart';

int shift = 0;
String dropdownValue = Globals.list.first;
bool sModeCaesar = true;
bool sModeVigenere = true;
bool sModeAphina = true;
bool darkMode = true;

class Globals {
  static const list = <String>[
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
  ];

  final List<DropdownMenuItem<String>> dropMenu = list
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
}
