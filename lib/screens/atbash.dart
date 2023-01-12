import 'package:flutter/material.dart';

class AtbashPage extends MaterialPageRoute {
  AtbashPage()
      : super(
          builder: (BuildContext context) {
            final controller = TextEditingController();

            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "«Шифр Атбаш»",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                centerTitle: true,
              ),
              body: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    height: 250,
                    child: Center(
                      child: TextFormField(
                        cursorWidth: 1,
                        maxLines: 8,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 23,
                          ),
                          labelText: 'Input',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onChanged: (value) {
                          String ruAlf = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя";
                          String enAlf = "abcdefghijklmnopqrstuvwxyz";
                          String out = "";

                          for (var i = 0; i < value.length; i++) {
                            if (ruAlf.contains(value[i].toLowerCase())) {
                              out += ruAlf[
                                  (ruAlf.indexOf(value[i].toLowerCase()) - 32)
                                      .abs()];
                            } else if (enAlf.contains(value[i].toLowerCase())) {
                              out += enAlf[
                                  (enAlf.indexOf(value[i].toLowerCase()) - 25)
                                      .abs()];
                            } else {
                              out += value[i];
                            }
                          }
                          controller.text = out;
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: 250,
                    child: TextFormField(
                      controller: controller,
                      cursorWidth: 1,
                      readOnly: true,
                      maxLines: 8,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontSize: 23,
                        ),
                        labelText: 'Output',
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
