// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jogos/model/jogoDoTermoState.dart';
import 'package:provider/provider.dart';

class Termo extends StatelessWidget {
  Termo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Termo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ChangeNotifierProvider(
        create: (_) => JogoDoTermoState(),
        child: Consumer<JogoDoTermoState>(
          builder: (context, state, _) {
            if (!state.jogoEmAndamento) {
              return state.mostrarResultado(context);
            } else {
              return Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int tentativa = 0; tentativa < 6; tentativa++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                for (int i = 0; i < state.palavra.length; i++)
                                  state.containerLetras(i, tentativa),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 28,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                        ),
                        itemBuilder: (context, index) {
                          String caractere = state.caracteres[index];

                          return GestureDetector(
                            onTap: () {
                              state.cliques(caractere);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  caractere.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            
          },
        ),
      ),
    );
  }
}