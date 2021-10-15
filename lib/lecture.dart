import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class TheoryPage extends StatelessWidget {
  TheoryPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      // Adding [ValueKey] to make sure that the widget gets rebuilt when
      // changing type.
      key: ValueKey(_transitionType),
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Lections"),
            ),
            key: _scaffoldKey,
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                ...List.generate(18, (index) {
                  return OpenContainer<bool>(
                    openColor: Colors.red,
                    closedColor: const Color(0xff3f3f3f),
                    transitionType: _transitionType,
                    openBuilder: (context, openContainer) =>
                        const _DetailsPage(),
                    tappable: false,
                    closedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    closedElevation: 0,
                    closedBuilder: (context, openContainer) {
                      return ListTile(
                        onTap: openContainer,
                        title: Text("Quack ${index + 1}"),
                        subtitle: const Text("Duck"),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quack"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Quack"),
                SizedBox(
                  height: 10,
                ),
                Text("Duck"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
