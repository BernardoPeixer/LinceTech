// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:exercicio_pratico_navegacao/view/pagina_cadastro.dart';
import 'package:flutter/material.dart';
import 'view/pagina_principal.dart';
import 'view/pagina_listagem.dart';
import 'view/pagina_edicao.dart';

const Color white = Colors.white;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: white,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/addUsers': (context) => AddUsers(),
        '/listPage': (context) => ListPage(),
        '/editPage': (context) => EditPage(),
      },
    );
  }
}
