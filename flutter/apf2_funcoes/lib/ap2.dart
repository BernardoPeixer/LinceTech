import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black38,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meu App'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.cyan,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.purple,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.transparent,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.yellow,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.white,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.yellow,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 50,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
