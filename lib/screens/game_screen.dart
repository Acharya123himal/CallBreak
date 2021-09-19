import 'package:callbreak/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var list = List.generate(13, (index) => index + 1)..shuffle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Image.asset(
          'assets/Cover.png',
          height: 100,
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/Cover.png',
                height: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/Cover.png',
                height: 100,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: CardView(
            list: list,
          ),
        ),
      ],
    ));
  }
}
