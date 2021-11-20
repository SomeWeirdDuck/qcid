import 'package:flutter/material.dart';
import 'dart:math';

class Lab2Show extends StatelessWidget {
  const Lab2Show({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ЛР2"),
      ),
      body: Center(
        child: ListView(
          children: [
            Text(CryptoTables.cryptoTableEncode()),
            Text(CryptoTables.cryptoTableDecode()),
            Text(CryptoTables.encodeMagic(
                CryptoTables.message, CryptoTables.list5x5)),
            Text(CryptoTables.decodeMagic(
                CryptoTables.encodeMagic(
                    CryptoTables.message, CryptoTables.list5x5),
                CryptoTables.list5x5,
                25)),
            Text(CryptoTables.encodeMagic(
                CryptoTables.message2, CryptoTables.list6x6)),
            Text(CryptoTables.decodeMagic(
                CryptoTables.encodeMagic(
                    CryptoTables.message2, CryptoTables.list6x6),
                CryptoTables.list6x6,
                36)),
          ],
        ),
      ),
    );
  }
}

class CryptoTables {
  static final List list5x5 = [
    [1, 2, 19, 20, 23],
    [18, 16, 9, 14, 8],
    [21, 11, 13, 15, 5],
    [22, 12, 17, 10, 4],
    [3, 24, 7, 6, 25]
  ];
  static final List list6x6 = [
    [6, 32, 33, 4, 35, 1],
    [25, 11, 27, 28, 8, 12],
    [19, 14, 16, 15, 23, 24],
    [18, 20, 22, 21, 17, 13],
    [7, 29, 10, 9, 26, 30],
    [36, 5, 3, 34, 2, 31],
  ];
  static const String message = "Займись делом наконец-то!";
  static const String message2 = "Что делать, если не хочеться делать?";

  static String cryptoTableEncode() {
    String phrase = "Привет";
    int a = 2;
    int b = 3;
    int c = 0;
    String encodedPhrase = "";
    var list = List.generate(a, (i) => List.filled(b, "", growable: false),
        growable: false);

    for (var j = 0; j < b; j++) {
      for (int i = 0; i < a; i++) {
        list[i][j] = phrase[c];
        c++;
      }
    }

    for (int i = 0; i < a; i++) {
      for (var j = 0; j < b; j++) {
        encodedPhrase += list[i][j];
      }
    }
    return encodedPhrase;
  }

  static String cryptoTableDecode() {
    String phrase = cryptoTableEncode();
    int listHeight = 2;
    int listWidth = 3;
    int counter = 0;
    String decodedPhrase = "";
    var list = List.generate(
        listHeight, (i) => List.filled(listWidth, "", growable: false),
        growable: false);
    for (int i = 0; i < listHeight; i++) {
      for (var j = 0; j < listWidth; j++) {
        list[i][j] = phrase[counter];
        counter++;
      }
    }
    for (var j = 0; j < listWidth; j++) {
      for (int i = 0; i < listHeight; i++) {
        decodedPhrase += list[i][j];
      }
    }
    return decodedPhrase;
  }

  static String encodeMagic(message, list) {
    String encodedOutput = "";
    for (var item in list) {
      for (var items in item) {
        encodedOutput += message[items - 1];
      }
    }
    return encodedOutput;
  }

  static String decodeMagic(encodedMessage, list, size) {
    String decodedOutput = "";
    int p = sqrt(size).toInt();
    for (var a = 0; a <= size; a++) {
      for (var i = 0; i < p; i++) {
        for (var j = 0; j < p; j++) {
          if (list[i][j] == a) {
            decodedOutput += encodedMessage[i * p + j];
          }
        }
      }
    }
    return decodedOutput;
  }
}
