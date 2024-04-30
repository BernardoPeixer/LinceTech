import 'package:atividade_pratica_introducao_2/widgets/circle_ap3.dart';
import 'package:atividade_pratica_introducao_2/widgets/square_ap3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? formaWidget;
  var texto = 'Mudar para quadrado';
  Color _corSelecionada = Colors.blue;
  bool circulo = true;
  List<Color> cores = [
    Colors.red,
    Colors.white,
    Colors.brown,
    Colors.pink,
    Colors.deepOrangeAccent,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.deepPurple,
  ];

  @override
  void initState() {
    super.initState();
    formaWidget = CirculoAp3(cor: _corSelecionada);
  }

  void mudarForma() {
    setState(() {
      circulo = !circulo;
      formaWidget = circulo
          ? CirculoAp3(
              cor: _corSelecionada,
            )
          : QuadradoAp3(
              cor: _corSelecionada,
            );
    });
  }

  void funcaoMudarTexto() {
    texto = circulo ? 'Mudar para circulo' : 'Mudar para quadrado';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black12,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black38,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Alterando Formas',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (formaWidget != null) formaWidget!,
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 70,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            )),
                        onPressed: () {
                          setState(() {
                            funcaoMudarTexto();
                            mudarForma();
                          });
                        },
                        child: Text(
                          texto,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )),
                      onPressed: () {
                        setState(() {
                          var _random = Random();
                          var indiceAleatorioDeCor =
                              _random.nextInt(cores.length);
                          _corSelecionada = cores[indiceAleatorioDeCor];
                          formaWidget = circulo
                              ? CirculoAp3(cor: _corSelecionada)
                              : QuadradoAp3(cor: _corSelecionada);
                        });
                      },
                      child: Text(
                          'Mudar cor',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
