// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'widgets/button_ap3.dart';
import 'widgets/button_restart_ap3.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

enum Status { playing, won, lost }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  int botaoCorreto = 0;
  int clicks = 0;
  Status status = Status.playing;
  int vitorias = 0;
  int derrotas = 0;

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    setState(() {
      botaoCorreto = random.nextInt(3);
      clicks = 0;
      status = Status.playing;
    });
  }

  void onUserTry(int opcao) {
    if (status != Status.playing) return;

    setState(() {
      clicks++;

      if (opcao == botaoCorreto) {
        status = Status.won;
        vitorias++;
      } else if (clicks >= 2) {
        status = Status.lost;
        derrotas++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget gameBody;

    switch (status) {
      case Status.playing:
        gameBody = Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Tente achar o botão correto!', style: TextStyle(fontSize: 30,),),
                  SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BotaoDeEscolha(
                index: 0,
                onUserTry: onUserTry,
                botaoCorreto: botaoCorreto,
              ),
              BotaoDeEscolha(
                index: 1,
                onUserTry: onUserTry,
                botaoCorreto: botaoCorreto,
              ),
              BotaoDeEscolha(
                index: 2,
                onUserTry: onUserTry,
                botaoCorreto: botaoCorreto,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Vitórias: $vitorias', style: TextStyle(fontSize: 25, color: Colors.green),),
          Text('Derrotas: $derrotas',style: TextStyle(fontSize: 25, color: Colors.red),),
        ],
        ),
        );
        break;
      case Status.won:
        gameBody = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text('Você ganhou', style: TextStyle(fontSize: 40, color: Colors.green),),
            ),
            BotaoRestart(
              resetGame: resetGame,
            ),
          ],
        );
        break;
      case Status.lost:
        gameBody = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text('Você perdeu',style: TextStyle(fontSize: 40,color: Colors.red),),
            ),
            BotaoRestart(
              resetGame: resetGame,
              
            ),
          ],
        );
        break;
    }

    return gameBody;
  }
}
