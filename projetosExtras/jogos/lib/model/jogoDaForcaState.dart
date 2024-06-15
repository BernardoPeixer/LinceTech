// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';
import '../utils/dicionario.dart';


class JogoDaForcaState with ChangeNotifier {
  bool fimDeJogo = false;

  String letras = 'abcdefghijklmnopqrstuvwxyz';

  List<String> letrasSelecionadas = [];
  int tentativas = 0;

  Random random = Random();

  String palavra =
      listaPalavras[Random().nextInt(listaPalavras.length)].toUpperCase();

  Widget letraEscondida(String letra, bool visivel) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Visibility(
        visible: !visivel,
        child: Text(
          letra,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget mostrarResultado(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              fimDeJogo && tentativas < 6
                  ? 'Parabéns, você ganhou!'
                  : 'Que pena, você perdeu!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: fimDeJogo && tentativas < 6 ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              fimDeJogo && tentativas < 6
                  ? 'Você adivinhou a palavra correta!'
                  : 'A palavra correta era: $palavra',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              onPressed: () {
                reiniciarJogo();
              },
              child: Text('Jogar Novamente', style: TextStyle(color: Colors.white  ),),
            ),
          ],
        ),
      ),
    );
  }

  void reiniciarJogo() {
    fimDeJogo = false;
    letrasSelecionadas.clear();
    tentativas = 0;
    palavra = listaPalavras[random.nextInt(listaPalavras.length)].toUpperCase();
    notifyListeners();
  }

  bool verificarFimDeJogo() {
    bool todasLetrasEncontradas = true;

    for (int i = 0; i < palavra.length; i++) {
      if (!letrasSelecionadas.contains(palavra[i])) {
        todasLetrasEncontradas = false;
        break;
      }
    }

    return todasLetrasEncontradas || tentativas >= 6;
  }

  Widget boneco(String path, bool visivel) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Image.asset(path),
    );
  }

  void adicionarTentativas(String e) {
    if (!letrasSelecionadas.contains(e.toUpperCase())) {
      letrasSelecionadas.add(e.toUpperCase());
      if (!palavra.toUpperCase().contains(e.toUpperCase())) {
        tentativas++;
      }

      fimDeJogo = verificarFimDeJogo();

      notifyListeners();
    }
  }

  
}
