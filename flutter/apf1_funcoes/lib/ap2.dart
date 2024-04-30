// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'dart:math';
import 'package:flutter/material.dart';

import 'widgets/button_ap2.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int tentativas = 0;
  Random random = Random();
  int botaoCorreto = 0;
  String texto = '';
  bool finalizou = false;

  @override
  void initState() {
    super.initState();

    botaoCorreto = random.nextInt(3) + 1;
  }

  void incrementarContador(int index) {
    if (finalizou) {
      return;
    }
    setState(() {
      tentativas++;
      if (index == botaoCorreto) {
        texto = "Você ganhou!";
        finalizou = true;
        return;
      }
      if (tentativas == 2) {
        texto = 'Você perdeu';
        finalizou = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.black38,
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Botões'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Consegue acertar o botão correto?',
                style: TextStyle(fontSize: 25, color: Colors.yellowAccent),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TesteButton(
                    index: 1,
                    expected: botaoCorreto,
                    incrementarContador: incrementarContador,
                    finalizou: finalizou,
                  ),
                  SizedBox(width: 10), // Adiciona um espaço entre os botões
                  TesteButton(
                    index: 2,
                    expected: botaoCorreto,
                    incrementarContador: incrementarContador,
                    finalizou: finalizou,
                  ),
                  SizedBox(width: 10),
                  TesteButton(
                    index: 3,
                    expected: botaoCorreto,
                    incrementarContador: incrementarContador,
                    finalizou: finalizou,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Tentativas: $tentativas',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
              Text(texto,
              style: TextStyle(color: Colors.white, fontSize: 30),),
            ],
          ),
        ),
      ),
    );
  }
}
