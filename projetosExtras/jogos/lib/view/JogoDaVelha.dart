// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/JogoDaVelhaState.dart';

class JogoDaVelha extends StatelessWidget {
  const JogoDaVelha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Jogo da Velha',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ChangeNotifierProvider(
        create: (_) => JogoDaVelhaState(),
        child: Consumer<JogoDaVelhaState>(builder: (context, state, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: state.textoTopo(),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (!state.gameEnd) {
                            state.jogada(index);
                            state.checarVencedor(index);
                            print(state.gameEnd);
                            state.snackBar(context);
                          }
                          
                        },
                        child: state.retornarContainer(index),
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Text(
                  'Vitórias X: ${state.vitoriasX}',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Vitórias O: ${state.vitoriasO}',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  onPressed: () {
                    state.reiniciarBotao();
                  },
                  child: Text(
                    'Reiniciar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
