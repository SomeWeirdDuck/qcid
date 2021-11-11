import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:quack/blank_page.dart';
import 'package:quack/labs/lab1.dart';
import 'package:quack/labs/lab2.dart';
import 'package:quack/lecture.dart';
import 'package:firebase_core/firebase_core.dart';
import './practice.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        backgroundColor: const Color(0xff5e5e5e),
      ),
      headerHeight: 5.0,
      backLayerBackgroundColor: const Color(0xff3f3f3f),
      frontLayerBackgroundColor: const Color(0xff3f3f3f),
      frontLayer: Center(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                      colors: [Color(0xff84FAB0), Color(0xff8FD3F4)])),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 110),
                    primary: Colors.transparent,
                    elevation: 0.0),
                onPressed: () {
                  Navigator.pushNamed(context, '/lectures');
                },
                child: const Text('Теория', style: TextStyle(fontSize: 36)),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                      colors: [Color(0xffFA709A), Color(0xffFEE140)])),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 110),
                    primary: Colors.transparent,
                    elevation: 0.0),
                onPressed: () {
                  Navigator.pushNamed(context, '/practice');
                },
                child: const Text('Практика', style: TextStyle(fontSize: 36)),
              ),
            ),
          ]
              .map(
                (Widget button) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 65.0),
                  child: button,
                ),
              )
              .toList(),
        ),
      ),
      backLayer: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(11.0),
          decoration: BoxDecoration(
            color: const Color(0xff5e5e5e),
            borderRadius: BorderRadius.circular(15),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Информация \n \n ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              children: <TextSpan>[
                TextSpan(
                    text:
                        'Данный программный продукт создан исключительно в целях обучения. \n \n Команда разработчиков не несет ответственность за неисправность приложения. \n\n С уважением, команда GooseINC.',
                    style:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 18)),
              ],
            ),
          )),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Backdrop(),
        '/blank': (context) => const Blank_p(),
        '/lectures': (context) => const LecturePageV2(),
        '/practice': (context) => const PracticePage(),
        '/labs/lab1': (context) => const Lab1Show(),
        '/labs/lab2': (context) => const Lab2Show(),
      },
    ),
  );
}


  //firebase_core: "^1.7.0"
  //cloud_firestore: "^2.5.3"
  //firebase_analytics: "^8.3.3"  
  //firebase_auth: "^3.1.3"
  //cloud_functions: "^3.0.4"
  //firebase_storage: "^10.0.3"