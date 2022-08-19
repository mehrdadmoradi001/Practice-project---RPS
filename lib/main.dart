import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(GameApplication());
}

class GameApplication extends StatefulWidget {
  const GameApplication({Key? key}) : super(key: key);

  @override
  State<GameApplication> createState() => _GameApplicationState();
}

class _GameApplicationState extends State<GameApplication> {
  int top = 1;
  int button = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('سنگ   کاغذ   قیچی'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        backgroundColor: Colors.deepOrange[700],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //-
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage('images/$top.png'),
                height: 100,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    top = Random().nextInt(3) + 1; //0-2 -> 1-3
                    button = Random().nextInt(3) + 1;
                  });
                },
                child: Text(
                  'شروع کن',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(primary: Colors.white),
              ),
              Image(
                image: AssetImage('images/$button.png'),
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
