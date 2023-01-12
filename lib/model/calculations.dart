import 'package:flutter/material.dart';
import 'globals.dart';

class Calculations {
  bool gcd(int a, int b) {
    while (a != 0 && b != 0) {
      if (a >= b) {
        a %= b;
      } else {
        b %= a;
      }
    }

    if (a == 1 || b == 1) {
      return true;
    } else {
      return false;
    }
  }

  int fin(int a, int m) {
    for (int i = 1; i <= m; i++) {
      if (a * i % m == 1) {
        return i;
      }
    }
    return 0;
  }

  void aphinn(
    TextEditingController inputController,
    TextEditingController outputController,
    TextEditingController firstKeyController,
    TextEditingController secondKeyController,
  ) {
    String ruAlf = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя";
    String enAlf = "abcdefghijklmnopqrstuvwxyz";
    String out = "";

    bool textLang = false;
    bool error = false;

    String text = inputController.text;

    int firstKey = 0;
    int secondKey = 0;

    try {
      firstKey = int.parse(firstKeyController.text);
      secondKey = int.parse(secondKeyController.text);
    } catch (e) {
      error = true;
    }

    for (var i = 0; i < text.length; i++) {
      if (i != 0) {
        if (ruAlf.contains(text[i]) != textLang) {
          error = true;
          break;
        }
      } else {
        ruAlf.contains(text[i]) ? textLang = true : textLang = false;
      }
    }

    if (!error && text != "") {
      if (sModeAphina) {
        if (textLang && ruAlf.length > firstKey) {
          if (!gcd(firstKey, ruAlf.length)) {
            outputController.text = out;
            return;
          }

          for (int i = 0; i < text.length; i++) {
            int pos =
                (firstKey * ruAlf.indexOf(text[i]) + secondKey) % ruAlf.length;
            out += ruAlf[pos % 33];
          }
        } else if (enAlf.length > firstKey) {
          if (!gcd(firstKey, enAlf.length)) {
            outputController.text = out;
            return;
          }

          for (int i = 0; i < text.length; i++) {
            int pos =
                (firstKey * enAlf.indexOf(text[i]) + secondKey) % enAlf.length;
            out += enAlf[pos % 26];
          }
        }
      } else {
        if (textLang && ruAlf.length > firstKey) {
          if (!gcd(firstKey, ruAlf.length)) {
            outputController.text = out;
            return;
          }

          int a = fin(firstKey, ruAlf.length);

          for (int i = 0; i < text.length; i++) {
            int pos = a * (ruAlf.indexOf(text[i]) - secondKey) % ruAlf.length;
            out += ruAlf[pos % 33];
          }
        } else if (enAlf.length > firstKey) {
          if (!gcd(firstKey, enAlf.length)) {
            outputController.text = out;
            return;
          }

          int a = fin(firstKey, enAlf.length);

          for (int i = 0; i < text.length; i++) {
            int pos = a * (enAlf.indexOf(text[i]) - secondKey) % enAlf.length;
            out += enAlf[pos % 26];
          }
        }
      }
    }
    outputController.text = out;
  }

  void vigenere(
      TextEditingController inputController,
      TextEditingController outputController,
      TextEditingController keyController) {
    String ruAlf = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя";
    String enAlf = "abcdefghijklmnopqrstuvwxyz";
    String out = "";

    String text = inputController.text;
    String key = keyController.text;

    bool textLang = false;
    bool keyLang = false;
    bool error = false;
    int j = 0;

    for (var i = 0; i < text.length; i++) {
      if (i != 0) {
        if (ruAlf.contains(text[i]) != textLang) {
          error = true;
          break;
        }
      } else {
        ruAlf.contains(text[i]) ? textLang = true : textLang = false;
      }
    }

    for (var i = 0; i < key.length; i++) {
      if (i != 0) {
        if (ruAlf.contains(key[i]) != keyLang) {
          error = true;
          break;
        }
      } else {
        ruAlf.contains(key[i]) ? keyLang = true : keyLang = false;
      }
    }

    if (keyLang == textLang && error == false && text != "" && key != "") {
      if (sModeVigenere) {
        for (var i = 0; i < text.length; i++) {
          if (textLang) {
            int pos = ruAlf.indexOf(text[i]) + ruAlf.indexOf(key[j]);
            out += ruAlf[pos % 33];
          } else {
            int pos = enAlf.indexOf(text[i]) + enAlf.indexOf(key[j]);
            out += enAlf[pos % 26];
          }

          j + 1 == key.length ? j = 0 : j++;
        }
      } else {
        for (var i = 0; i < text.length; i++) {
          if (textLang) {
            int pos = ruAlf.indexOf(text[i]) - ruAlf.indexOf(key[j]);
            out += ruAlf[(33 + pos) % 33];
          } else {
            int pos = enAlf.indexOf(text[i]) - enAlf.indexOf(key[j]);
            out += enAlf[(26 + pos) % 26];
          }

          j + 1 == key.length ? j = 0 : j++;
        }
      }
    }

    outputController.text = out;
  }

  void caesar(
    TextEditingController inputController,
    TextEditingController outputController,
  ) {
    String value = inputController.text;
    String ruAlf = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя";
    String enAlf = "abcdefghijklmnopqrstuvwxyz";
    String out = "";
    late int index;

    for (var i = 0; i < value.length; i++) {
      if (sModeCaesar) {
        if (ruAlf.contains(value[i].toLowerCase())) {
          if (ruAlf.indexOf(value[i].toLowerCase()) + shift >= ruAlf.length) {
            index =
                ruAlf.indexOf(value[i].toLowerCase()) + shift - ruAlf.length;
          } else {
            index = ruAlf.indexOf(value[i].toLowerCase()) + shift;
          }
          out += ruAlf[index];
        } else if (enAlf.contains(value[i].toLowerCase())) {
          if (enAlf.indexOf(value[i].toLowerCase()) + shift >= enAlf.length) {
            index =
                enAlf.indexOf(value[i].toLowerCase()) + shift - enAlf.length;
          } else {
            index = enAlf.indexOf(value[i].toLowerCase()) + shift;
          }
          out += enAlf[index];
        } else {
          out += value[i];
        }
      } else {
        if (ruAlf.contains(value[i].toLowerCase())) {
          if (ruAlf.indexOf(value[i].toLowerCase()) - shift < 0) {
            index =
                ruAlf.length - ruAlf.indexOf(value[i].toLowerCase()) - shift;
          } else {
            index = ruAlf.indexOf(value[i].toLowerCase()) - shift;
          }
          out += ruAlf[index];
        } else if (enAlf.contains(value[i].toLowerCase())) {
          if (enAlf.indexOf(value[i].toLowerCase()) - shift < 0) {
            index =
                enAlf.length - enAlf.indexOf(value[i].toLowerCase()) - shift;
          } else {
            index = enAlf.indexOf(value[i].toLowerCase()) - shift;
          }
          out += enAlf[index];
        } else {
          out += value[i];
        }
      }
    }
    outputController.text = out;
  }
}
