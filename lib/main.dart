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
  int bottom = 1;
  int numBottom = 0;
  int numTop = 0;
  var imgTop = 'arow';
  var imgBottom = 'arow';
  bool flagBottom = false;
  bool flagTop = false;

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
              _Display(numTop, imgTop, flagTop),
              _Image(top),
              TextButton(
                onPressed: () {
                  setState(() {
                    top = Random().nextInt(3) + 1; //0-2 -> 1-3
                    bottom = Random().nextInt(3) + 1;

                    if (top == 1 && bottom == 3) {
                      numTop = numTop + 1;
                      flagTop = true;
                      flagBottom = false;
                    } else if (top == 2 && bottom == 3) {
                      numBottom = numBottom + 1;
                      flagBottom = true;
                      flagTop = false;
                    } else if (top == 3 && bottom == 1) {
                      numBottom = numBottom + 1;
                      flagBottom = true;
                      flagTop = false;
                    } else if (top == 2 && bottom == 1) {
                      numTop = numTop + 1;
                      flagTop = true;
                      flagBottom = false;
                    } else if (top == 3 && bottom == 2) {
                      numTop = numTop + 1;
                      flagTop = true;
                      flagBottom = false;
                    } else if (top == 1 && bottom == 2) {
                      numBottom = numBottom + 1;
                      flagBottom = true;
                      flagTop = false;
                    }
                  });
                },
                child: Text(
                  'بزن بریم',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                style: TextButton.styleFrom(primary: Colors.blue[900]),
              ),
              _Image(bottom),
              _Display(numBottom, imgBottom, flagBottom),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Image(int img) {
    return Image(
      image: AssetImage('images/$img.png'),
      height: 100,
    );
  }

  Widget _Display(int text, String image, bool flag) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 180),
          child: Container(
            width: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.orange[300]),
              child: Text('$text',
                  style: TextStyle(fontSize: 28), textAlign: TextAlign.center),
            ),
          ),
        ),
        Visibility(
          visible: flag,
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Image(
                image: AssetImage('images/$image.png'),
                width: 40,
                height: 40,
                alignment: Alignment.bottomRight),
          ),
        ),
      ],
    );
  }
}
