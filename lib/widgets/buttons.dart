import 'package:flutter/material.dart';
import '../model/globals.dart';

class GroupButt extends StatefulWidget {
  const GroupButt({
    super.key,
    required this.changer,
    required this.mode,
  });

  final Function changer;
  final int mode;
  final String crypt = "Шифровка";
  final String decrypt = "Дешифровка";

  @override
  GroupButtonClass createState() => GroupButtonClass();
}

class GroupButtonClass extends State<GroupButt> {
  Color _cardCol = Colors.green;
  Color _col = Colors.green;
  Color _splashCol = Colors.orange;
  String _str = "Шифровка";

  void iniState() => super.initState();

  void switchColorAndText() {
    _col = _cardCol;
    _cardCol = _splashCol;
    _splashCol = _col;
    _str == widget.decrypt ? _str = widget.crypt : _str = widget.decrypt;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _cardCol,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 100.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          splashColor: _splashCol,
          onTap: () {
            setState(
              () {
                if (widget.mode == 0) {
                  sModeCaesar ? sModeCaesar = false : sModeCaesar = true;
                } else if (widget.mode == 1) {
                  sModeVigenere ? sModeVigenere = false : sModeVigenere = true;
                } else if (widget.mode == 2) {
                  sModeAphina ? sModeAphina = false : sModeAphina = true;
                }
                switchColorAndText();
                widget.changer();
              },
            );
          },
          child: Center(
            child: Text(_str),
          ),
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  final Function changer;

  const DropDown({super.key, required this.changer});

  @override
  DropDownClass createState() => DropDownClass();
}

class DropDownClass extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        setState(
          () {
            dropdownValue = value!;
            value != 'None' ? shift = int.parse(value) : shift = -1;
            widget.changer();
          },
        );
      },
      items: Globals.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
