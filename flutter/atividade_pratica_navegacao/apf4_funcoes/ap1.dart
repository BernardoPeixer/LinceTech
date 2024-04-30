import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/screen2': (context) {
          final color = ModalRoute.of(context)!.settings.arguments as Color;
          return SecondScreen(color: color);
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final coresLista = [
    Cores('Vermelho', Colors.red),
    Cores('Verde', Colors.green),
    Cores('Azul', Colors.blue),
    Cores('Roxo', Colors.purple),
    Cores('Laranja', Colors.orange),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cor selecionada',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: coresLista.length,
          itemBuilder: (context, indice) {
            final item = coresLista[indice];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/screen2', arguments: item.cor);
              },
              child: Container(
                height: 70,
                color: item.cor,
                child: Center(
                  child: Text(
                    item.nome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cor escolhida'),
      ),
      body: Container(
        color: color,
      ),
    );
  }
}

class Cores extends StatelessWidget {
  String nome;
  Color cor;

  Cores(this.nome, this.cor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/screen2',
          arguments: Cores(nome, cor),
        );
      },
    );
  }
}
