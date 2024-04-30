// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  var richBlack = Color.fromRGBO(0, 23, 31, 1);

  var gunMetal = Color.fromRGBO(0, 46, 61, 0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: richBlack,
      appBar: AppBar(
        backgroundColor: gunMetal,
        title: Center(
          child: Text(
            'PORTAL STH',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BotaoCadastroHomePage(),
            SizedBox(
              height: 20,
            ),
            BotaoListaHomePage(),
          ],
        ),
      )),
    );
  }
}

class BotaoCadastroHomePage extends StatelessWidget {
  BotaoCadastroHomePage({super.key});

  var blue = Color.fromRGBO(47, 84, 255, 1);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/addUsers');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/add_user.png',
                  width: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'CADASTRO DE PESSOAS',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

class BotaoListaHomePage extends StatelessWidget {
  BotaoListaHomePage({super.key});

  var blue = Color.fromRGBO(47, 84, 255, 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/listPage');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Image.asset(
                'assets/user_list.png',
                width: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  'LISTA DE PESSOAS',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
