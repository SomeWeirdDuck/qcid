import 'dart:math';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Lab11_Show extends StatelessWidget {
  const Lab11_Show({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        // Adding [ValueKey] to make sure that the widget gets rebuilt when
        // changing type.
        onGenerateRoute: (settings) {
      return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      main();
                    },
                    child: const Text('Сгенерировать пароль'),
                  ),
                ),
              ));
    });
  }
}

class PasswordGenerator {
  static String generate(length, collection) {
    var rand = Random();
    String password = "";
    for (int i = 0; i < length; i++) {
      var index = rand.nextInt(collection.length);
      password += collection[index];
    }
    return password;
  }

  static String generateWithMap({required PasswordSegmentMapper map}) {
    var rand = Random();
    String password = "";
    print(map.length);
    for (int i = 0; i < map.length; i++) {
      var segment = PasswordSegmentMapper.getSegmentMap(map.segment[i]);
      if (segment == "empty") {
        password += map.segment[i];
        continue;
      }
      print("map - " + segment);
      var index = rand.nextInt(segment.length);
      password += segment[index];
    }
    return password;
  }
}

class PasswordSegmentMapper {
  static const dicts = <String, String>{
    "russian_low": "йцукенгшщзхъфывапролджэячсмитьбю",
    "russian_up": "ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ",
    "numbers": "1234567890",
    "symbols": "!#\$\"%&`,*",
  };
  int length = 0;
  List<String> segment;

  PasswordSegmentMapper(this.segment) {
    length = segment.length;
  }

  static getSegmentMap(String str) {
    if (dicts[str] == null) return "empty";
    return dicts[str];
  }
}

String customValue(int N) {
  // Любая другая функция
  var expr = (pow(N, 4) % 100);
  return expr < 10 ? "0" + expr.toString() : expr.toString();
}

void main() {
  String pas1, pas2;
  // ignore: non_constant_identifier_names
  String user_text = "YaVvel16Simvolov";
  final int N = user_text.length;

  var map1 = [
    "russian_low",
    "russian_low",
    "russian_low",
    "russian_up",
    "russian_up",
    "numbers",
    customValue(N),
    "russian_up",
  ];

  PasswordSegmentMapper psm = PasswordSegmentMapper(map1);
  pas1 = PasswordGenerator.generate(16, "qewrtyuiopasfdghjklxc");
  pas2 = PasswordGenerator.generateWithMap(map: psm);

  print("P1: " + pas1);
  print("P2: " + pas2);
}
