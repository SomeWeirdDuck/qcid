// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Lab1Show extends StatefulWidget {
  const Lab1Show({Key? key}) : super(key: key);
  @override
  _Lab1ShowState createState() => _Lab1ShowState();
}

class _Lab1ShowState extends State<Lab1Show> {
  bool generatedText1 = false;
  bool generatedText2 = false;
  late String quack1;
  late String quack2;
  late String bonk;

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (settings) {
      String val;
      return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
                body: Center(
                  child: ListView(
                    children: [
                      generatedText1 ? Text(quack1) : const Text(""),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            quack1 = PasswordGenerator.generator(
                                8, "абвгдеёжзийклмнопрстуфхцчшщъыьэю");
                            generatedText1 = true;
                          });
                        },
                        child: const Text('Сгенерировать пароль 1'),
                      ),
                      TextField(onSubmitted: (val) {
                        setState(() {
                          bonk = val;
                        });
                      }),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            quack2 = PasswordGenerator.mapGenerator(bonk);
                            generatedText2 = true;
                          });
                        },
                        child: const Text('Сгенерировать пароль 2'),
                      ),
                      generatedText2 ? Text(quack2) : const Text(""),
                    ],
                  ),
                ),
              ));
    });
  }
}

class PasswordGenerator {
  static String generator(length, collection) {
    var rand = Random();
    String password = "";
    for (int i = 0; i < length; i++) {
      var index = rand.nextInt(collection.length);
      password += collection[index];
    }
    return password;
  }

  static String mapGenerator(custom_map) {
    var rand = Random();
    int size = 8;
    String dict1 = "!\”#\$%&’,*",
        dict2 = "1234567890",
        dict3 = "qwertyuiopasdfghjklzxcvbnm",
        password = "";
    int Q = custom_map.length ~/ 5;
    for (int i = 0; i <= Q; i++) {
      var index = rand.nextInt(dict1.length);
      password += dict1[index];
    }
    for (int i = Q; i < size - 1; i++) {
      var index = rand.nextInt(dict2.length);
      password += dict2[index];
    }
    password += dict3[rand.nextInt(dict3.length)];

    return password;
  }
}

void main() {
  String password1, password2;
  String map = "hahdjkbbfdbl";
  password1 =
      PasswordGenerator.generator(8, "абвгдеёжзийклмнопрстуфхцчшщъыьэю");
  password2 = PasswordGenerator.mapGenerator(map);
  print("Password 1 : " + password1);
  print("Password 2 : " + password2);
}
