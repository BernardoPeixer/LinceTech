// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:jogos/model/loginState.dart';
import 'package:jogos/view/DadosDoPerfil.dart';
import 'package:jogos/view/Desempenho.dart';
import 'package:jogos/view/FotoDePerfil.dart';
import 'package:jogos/view/JogoDaVelha.dart';
import 'package:jogos/view/Login.dart';
import 'package:jogos/view/Termo.dart';
import 'package:jogos/view/Forca.dart';
import 'package:jogos/view/BatalhaNaval.dart';
import 'package:provider/provider.dart';

import 'view/MenuJogos.dart';
import 'package:flutter/material.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.black, systemNavigationBarColor: Colors.black),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginState(),
      child: Consumer<LoginState>(builder: (_, state, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/HomePage',
          routes: {
            '/HomePage': (context) => HomePage(),
            '/JogoDaVelha': (context) => JogoDaVelha(),
            '/Forca': (context) => Forca(),
            '/Termo': (context) => Termo(),
            '/BatalhaNaval': (context) => BatalhaNaval(),
            '/Login': (context) => Login(),
            '/FotoDePerfil': (context) => FotoDePerfil(),
            '/DadosDoPerfil': (context) => DadosDoPerfil(),
            '/Desempenho': (context) => Desempenho(),
          },
        );
      }),
    );
  }
}
