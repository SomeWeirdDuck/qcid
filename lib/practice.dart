import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {
  final int clr1;
  final int clr2;
  final String txt;
  final Function() func;

  const ButtonGradient(
      {Key? key,
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
          child: Text(txt)),
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
        padding: const EdgeInsets.all(20),
        mainAxisSpacing: 10,
        crossAxisSpacing: 9,
        crossAxisCount: 2,
        children: <Widget>[
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
          ButtonGradient(
            txt: "2",
            func: () => Navigator.pushNamed(context, '/labs/lab1/lab1'),
            clr1: 0xff84FAB0,
            clr2: 0xff8FD3F4,
          ),
        ],
      ),
    );
  }
}
