import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LecturePageV2 extends StatelessWidget {
  const LecturePageV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff3f3f3f),
        appBar: AppBar(title: const Text("Lectures")),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ...List.generate(11, (index) {
              return TitleExemp(idx: index);
            })
          ],
        ));
  }
}
//Navigator.pushNamed(context, '/labs/lab1')

class TitleExemp extends StatelessWidget {
  final int idx;
  const TitleExemp({Key? key, required this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailsPage(idx: idx))),
      title: Text("${idx + 1}. Text"),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final int idx;
  const DetailsPage({Key? key, required this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quack ${idx + 1}"),
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('test').doc().get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data!.get('test')),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
