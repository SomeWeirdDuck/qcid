import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {
  final int clr1;
  final int clr2;
  final String txt;
  final FontWeight weight;
  final double s = 17.0;
  final Color col = const Color(0xff3f3f3f);
  final Function() func;

  const ButtonGradient(
      {Key? key,
      required this.weight,
      required this.clr1,
      required this.clr2,
      required this.txt,
      required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [Color(clr1), Color(clr2)]),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, elevation: 0.0),
        onPressed: func,
        child: Text(
          txt,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: col,
            fontSize: s,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class PracticePage extends StatelessWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3f3f3f),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 9,
        crossAxisCount: 2,
        children: <Widget>[
          ButtonGradient(
            txt: "Реализация генератора паролей с заданным параметром",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: "Шифрование методом перестановки",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xffFA709A,
            clr2: 0xffFEE140,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: "Шифрование методами замены",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xffFEE140,
            clr2: 0xffFA709A,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: " Генератор псевдослучайной последовательности",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff8FD3F4,
            clr2: 0xff84FAB0,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: "Исследование симметричных криптоалгоритмов",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: "Исследование ассиметричных криптоалгоритмов",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xffFA709A,
            clr2: 0xffFEE140,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: "Исследование криптографических хэш-функций",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xffFEE140,
            clr2: 0xffFA709A,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: "Защита от компьютерных вирусов",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff8FD3F4,
            clr2: 0xff84FAB0,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: "Защита от несанкционированной эксплуатации",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: "Реализация системы защиты ПС",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xffFA709A,
            clr2: 0xffFEE140,
            weight: FontWeight.w700,
          ),
          ButtonGradient(
            txt: "Защита данных средствами СУБД MS Access",
            func: () => Navigator.pushNamed(context, '/labs/lab1/lab1'),
            clr1: 0xffFEE140,
            clr2: 0xffFA709A,
            weight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
