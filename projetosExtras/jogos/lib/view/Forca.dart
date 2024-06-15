// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jogos/model/jogoDaForcaState.dart';
import 'package:provider/provider.dart';

class Forca extends StatelessWidget {
  Forca({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Jogo da Forca',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ChangeNotifierProvider(
        create: (_) => JogoDaForcaState(),
        child: Consumer<JogoDaForcaState>(
          builder: (context, state, _) {
            if (state.fimDeJogo) {
              return state.mostrarResultado(context);
            } else {
              return Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Stack(
                              children: [
                                if (state.tentativas >= 0)
                                  state.boneco(
                                      'assets/hang.png', state.tentativas >= 0),
                                if (state.tentativas >= 1)
                                  state.boneco(
                                      'assets/head.png', state.tentativas >= 1),
                                if (state.tentativas >= 2)
                                  state.boneco(
                                      'assets/body.png', state.tentativas >= 2),
                                if (state.tentativas >= 3)
                                  state.boneco(
                                      'assets/la.png', state.tentativas >= 3),
                                if (state.tentativas >= 4)
                                  state.boneco(
                                      'assets/ra.png', state.tentativas >= 4),
                                if (state.tentativas >= 5)
                                  state.boneco(
                                      'assets/ll.png', state.tentativas >= 5),
                                if (state.tentativas >= 6)
                                  state.boneco(
                                      'assets/rl.png', state.tentativas >= 6),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: state.palavra
                                    .split('')
                                    .map(
                                      (e) => state.letraEscondida(
                                        e,
                                        !state.letrasSelecionadas.contains(
                                          e.toUpperCase(),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          )
                        ],
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 7,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        children: state.letras.split('').map((e) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            onPressed: state.letrasSelecionadas
                                    .contains(e.toUpperCase())
                                ? null
                                : () {
                                    state.adicionarTentativas(e);
                                  },
                            child: Text(
                              e.toUpperCase(),
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
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
