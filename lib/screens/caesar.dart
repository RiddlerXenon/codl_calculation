import 'package:flutter/material.dart';
import '../widgets/buttons.dart';
import '../model/calculations.dart';
import '../model/globals.dart';

class CaesarPage extends MaterialPageRoute {
  CaesarPage()
      : super(
          builder: (BuildContext context) {
            final outputController = TextEditingController();
            final inputController = TextEditingController();

            sModeCaesar = true;

            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "«Шифр Цезаря»",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                centerTitle: true,
              ),
              body: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    child: GroupButt(
                      mode: 0,
                      changer: () => Calculations()
                          .caesar(inputController, outputController),
                    ),
                  ),
                  Container(
                    height: 70,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      title: const Text(
                        "Выберите размер сдвига: ",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: DropDown(
                        changer: () => Calculations()
                            .caesar(inputController, outputController),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    padding: const EdgeInsets.all(10),
                    height: 250,
                    child: Center(
                      child: TextFormField(
                        controller: inputController,
                        onChanged: (value) => Calculations()
                            .caesar(inputController, outputController),
                        cursorWidth: 1,
                        maxLines: 8,
                        decoration: InputDecoration(
                          labelText: 'Input',
                          labelStyle: const TextStyle(
                            fontSize: 23,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 250,
                    child: TextFormField(
                      readOnly: true,
                      controller: outputController,
                      cursorWidth: 1,
                      maxLines: 8,
                      decoration: InputDecoration(
                        labelText: 'Output',
                        labelStyle: const TextStyle(
                          fontSize: 23,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
}
