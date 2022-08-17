import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  image: AssetImage('images/1.png'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('شروع کن',style: TextStyle(fontSize: 20),),
                  style: TextButton.styleFrom(primary: Colors.white),
                ),
                Image(
                  image: AssetImage('images/2.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
