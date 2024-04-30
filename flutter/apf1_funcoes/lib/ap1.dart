// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String texto = "Sortear Cor";
  Color cor = Colors.white;

  List<Color> coresDisponiveis = [
    Colors.red,
    Colors.blue,
    Colors.grey,
    Colors.pink,
  ];

  void sortearCor() {
    setState(() {
      int indiceRandom = Random().nextInt(coresDisponiveis.length);
      cor = coresDisponiveis[indiceRandom];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            sortearCor();
          },
          child: Text(
            texto,textDirection: TextDirection.ltr,
            style: TextStyle(color : cor, fontSize: 50),
          )),
    );
  }
}
