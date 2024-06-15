import 'package:flutter/material.dart';
import '../utils/dicionario.dart';
import 'dart:math';

class JogoDoTermoState with ChangeNotifier {
  String caracteres = 'QWERTYUIOPASDFGHJKLZXCVBNM⌫↵';
  String palavra =
      listaPalavras[Random().nextInt(listaPalavras.length)].toUpperCase();
  bool jogoEmAndamento = true;
  bool palavraCorreta = true;
  List<List<String>> letrasClicadasPorLinha = List.generate(6, (_) => []);
  int tentativas = 0;
  List<List<Color>> coresPorLinha = List.generate(6, (_) => []);

  JogoDoTermoState() {
    for (int i = 0; i < 6; i++) {
      coresPorLinha[i] = List.filled(palavra.length, Colors.grey[800]!);
    }
  }

  Widget containerLetras(int index, int tentativa) {
    List<String> letras = letrasClicadasPorLinha[tentativa];
    String letra = letras.length > index ? letras[index] : '';
    Color cor = coresPorLinha[tentativa][index];

    return Container(
      alignment: Alignment.center,
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: cor,
        border: Border.all(
          color: Colors.grey.shade900,
          width: 3.4,
        ),
      ),
      child: Text(
        letra,
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  void cliques(String caractere) {
    if (caractere == '⌫') {
      if (letrasClicadasPorLinha[tentativas].isNotEmpty) {
        letrasClicadasPorLinha[tentativas].removeLast();
        notifyListeners();
      }
    } else if (caractere == '↵') {
      if (letrasClicadasPorLinha[tentativas].length == palavra.length) {
        validarPalavra();
        tentativas++;
        notifyListeners();
      }
    } else {
      List<String> letras = letrasClicadasPorLinha[tentativas];
      if (letras.length < palavra.length) {
        letras.add(caractere);
        notifyListeners();
      }
    }
  }

  void validarPalavra() {
    for (int i = 0; i < palavra.length; i++) {
      String letra = letrasClicadasPorLinha[tentativas][i];
      if (letra == palavra[i]) {
        coresPorLinha[tentativas][i] = Colors.green;
      } else if (palavra.contains(letra)) {
        coresPorLinha[tentativas][i] = Colors.yellow;
      } else {
        palavraCorreta = false;
      }
    }

    if (letrasClicadasPorLinha[tentativas].length == palavra.length) {
      palavraCorreta = letrasClicadasPorLinha[tentativas].join() == palavra;
    }

    if (palavraCorreta || tentativas == 5) {
      jogoEmAndamento = false;
    }
  }

  void reiniciarJogo() {
    letrasClicadasPorLinha = List.generate(6, (_) => []);
    coresPorLinha = List.generate(6, (_) => []);
    palavra =
        listaPalavras[Random().nextInt(listaPalavras.length)].toUpperCase();
    tentativas = 0;
    for (int i = 0; i < 6; i++) {
      coresPorLinha[i] = List.filled(palavra.length, Colors.grey[800]!);
    }
    jogoEmAndamento = true;
    palavraCorreta = true;

    notifyListeners();
  }

  Widget mostrarResultado(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              palavraCorreta
                  ? 'Parabéns, você ganhou!'
                  : 'Que pena, você perdeu!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: palavraCorreta ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              palavraCorreta
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
              child: Text(
                'Jogar Novamente',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
