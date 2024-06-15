//ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, sized_box_for_whitespace, camel_case_types, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../model/loginState.dart';
import '../utils/drawerTeste.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Radius radius = Radius.circular(10);

  Color color = Color.fromRGBO(1, 14, 33, 1);
  Color color2 = Color.fromRGBO(23, 53, 99, 1);

  bool visivel = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(builder: (context, state, _) {
      return
      Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          backgroundColor: color,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: !state.logado,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Login');
                  },
                  child: Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(color2)),
                ),
              ),
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(radius),
                            image: DecorationImage(
                              image: AssetImage('assets/jogoDaVelha.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 6,
                          child: ElevatedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/JogoDaVelha'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                'Jogo da velha',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(radius),
                          image: DecorationImage(
                            image: AssetImage('assets/jogoDaForca.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/Forca'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              'Jogo da forca',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(radius),
                            image: DecorationImage(
                              image: AssetImage('assets/jogoDoTermo.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 6,
                          child: ElevatedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/Termo'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                'Termo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(radius),
                          image: DecorationImage(
                            image: AssetImage('assets/jogoDaBatalhaNaval.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/BatalhaNaval'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              'Batalha Naval',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
