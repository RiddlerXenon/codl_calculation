import 'package:cold_calculation/model/calculations.dart';
import 'package:flutter/material.dart';
import '../widgets/buttons.dart';
import '../model/globals.dart';

class AphinnPage extends MaterialPageRoute {
  AphinnPage()
      : super(
          builder: (BuildContext context) {
            final outputController = TextEditingController();
            final inputController = TextEditingController();
            final firstKeyController = TextEditingController();
            final secondKeyController = TextEditingController();

            sModeAphina = true;

            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "«Афинный шифр»",
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
                      mode: 2,
                      changer: () => Calculations().aphinn(
                        inputController,
                        outputController,
                        firstKeyController,
                        secondKeyController,
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
                        onChanged: (value) => Calculations().aphinn(
                          inputController,
                          outputController,
                          firstKeyController,
                          secondKeyController,
                        ),
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
                    height: 100,
                    child: TextFormField(
                      onChanged: (value) => Calculations().aphinn(
                        inputController,
                        outputController,
                        firstKeyController,
                        secondKeyController,
                      ),
                      controller: firstKeyController,
                      cursorWidth: 1,
                      maxLines: 8,
                      decoration: InputDecoration(
                        labelText: 'First Key',
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    child: TextFormField(
                      onChanged: (value) => Calculations().aphinn(
                        inputController,
                        outputController,
                        firstKeyController,
                        secondKeyController,
                      ),
                      controller: secondKeyController,
                      cursorWidth: 1,
                      maxLines: 8,
                      decoration: InputDecoration(
                        labelText: 'Second Key',
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
