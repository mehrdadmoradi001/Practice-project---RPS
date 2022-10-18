import 'dart:math';
import 'package:flutter_rock_paper_scissor/constant.dart';
import 'package:hexcolor/hexcolor.dart';

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
  int numBottom = 0;
  int numTop = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'سنگ   کاغذ   قیچی',
            style: TextStyle(color: Colors.blue[900]),
          ),
          centerTitle: true,
          backgroundColor: topColor,
        ),
        backgroundColor: bottomColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //-
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,color: Colors.orange[300]),
                child: Text('$numTop',
                    style: TextStyle(fontSize: 28),
                    textAlign: TextAlign.center),
              ),
              Image(
                image: AssetImage('images/$top.png'),
                height: 100,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    top = Random().nextInt(3) + 1; //0-2 -> 1-3
                    button = Random().nextInt(3) + 1;

                    if (top == 1 && button == 3) {
                      numTop = numTop + 1;
                    } else if (top == 2 && button == 3) {
                      numBottom = numBottom + 1;
                    } else if (top == 3 && button == 1) {
                      numBottom = numBottom + 1;
                    } else if (top == 2 && button == 1) {
                      numTop = numTop + 1;
                    } else if (top == 3 && button == 2) {
                      numTop = numTop + 1;
                    } else if (top == 1 && button == 2) {
                      numBottom = numBottom + 1;
                    }
                  });
                },
                child: Text(
                  'بزن بریم',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(primary: Colors.blue[900]),
              ),
              Image(
                image: AssetImage('images/$button.png'),
                height: 100,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,color: Colors.amber[100]),
                child: Text('$numBottom',
                    style: TextStyle(fontSize: 28),
                    textAlign: TextAlign.center),
              )
            ],
          ),
        ),
      ),
    );
  }
}

