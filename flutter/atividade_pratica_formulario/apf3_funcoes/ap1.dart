// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  bool isChecked = false;
  String? nome;
  int? idade;
  final _keyForm = GlobalKey<FormState>();

  bool primeiraLetraMaiuscula(String texto) {
    if (texto.isEmpty) {
      return false;
    }
    return texto[0].toUpperCase() == texto[0];
  }

  void _salvarFormulario() {
    if (_keyForm.currentState!.validate()) {
      _keyForm.currentState!.save();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Formulário de cadastro',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Form(
          key: _keyForm,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'O nome não foi inserido';
                      }
                      if (value.length < 3) {
                        return 'O nome inserido é muito curto';
                      }
                      if (!primeiraLetraMaiuscula(value)) {
                        return 'O nome deve começar com letra maiúscula';
                      }
                      return null;
                    },
                    onSaved: (value) => nome = value,
                    decoration: InputDecoration(
                      labelText: 'Insira seu nome',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'A idade não foi inserida';
                      }
                      if (value.length > 3) {
                        return 'Idade inválida';
                      }
                      int? idade = int.tryParse(value);
                      if (idade == null) {
                        return 'Idade inválida';
                      }

                      if (idade < 18) {
                        return 'Não é permitido menores de 18 anos se cadastrarem';
                      }
                      return null;
                    },
                    onSaved: (value) => idade = int.parse(value!),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Insira sua idade',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          value: isChecked,
                          checkColor: Colors.white,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          }),
                      Text(
                        'Inativo',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.greenAccent,
                            ),
                          ),
                          onPressed: () {
                            _salvarFormulario();
                          },
                          child: Text(
                            'Enviar',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  nome != null && idade != null
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: isChecked ? Colors.grey : Colors.green,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Nome: $nome',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'Idade: $idade',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'Status: ${isChecked ? 'Inativo' : 'Ativo'}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
