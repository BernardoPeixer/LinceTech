// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_final_fields, curly_braces_in_flow_control_structures, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

enum Jogador { vazio, x, o }

class JogoDaVelhaState with ChangeNotifier {
  List<Jogador> _jogadas = List.filled(9, Jogador.vazio);

  List<Jogador> get jogadas => _jogadas;

  int cliques = 0;

  var vitoriasX = 0;
  var vitoriasO = 0;

  late var vencedor;

  bool gameEnd = false;

  Jogador jogadorAtual = Jogador.o;

  void acrescentarPontos() {
    if (vencedor == Jogador.o) {
      vitoriasO++;
    } else if (vencedor == Jogador.x) {
      vitoriasX++;
    }
  }

  void jogada(int index) {
    if (_jogadas[index] == Jogador.vazio) {
      if (jogadorAtual == Jogador.o) {
        _jogadas[index] = Jogador.o;
      } else if (jogadorAtual == Jogador.x) {
        _jogadas[index] = Jogador.x;
      }
      mudarJogadador();
      cliques++;
    }

    print(index);
    notifyListeners();
  }

  void mudarJogadador() {
    if (jogadorAtual == Jogador.o) {
      jogadorAtual = Jogador.x;
    } else {
      jogadorAtual = Jogador.o;
    }
  }

  Widget? textoTopo() {
    if (!gameEnd) {
      return Column(
        children: [
          Text(
            jogadorAtual == Jogador.o ? 'Vez de Jogador O' : 'Vez de Jogador X',
            style: TextStyle(
              color: jogadorAtual == Jogador.o ? Colors.blue : Colors.orange,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else if (gameEnd && vencedor != null) {
      return Column(
        children: [
          Text(
            cliques.isOdd ? "Jogador O venceu!" : "Jogador X venceu!",
            style: TextStyle(
              color: cliques.isOdd ? Colors.blueGrey : Colors.red,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else if (gameEnd && vencedor == null) {
      return Column(
        children: [
          Text(
            "Empate!",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
    notifyListeners();
  }

  void checarVencedor(int index) {
    List<List<int>> linhasVencedoras = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Linhas
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Colunas
      [0, 4, 8], [2, 4, 6] // Diagonais
    ];

    for (var linha in linhasVencedoras) {
      int a = linha[0];
      int b = linha[1];
      int c = linha[2];

      if (_jogadas[a] != Jogador.vazio &&
          _jogadas[a] == _jogadas[b] &&
          _jogadas[a] == _jogadas[c]) {
        vencedor = cliques.isOdd ? Jogador.o : Jogador.x;

        gameEnd = true;

        acrescentarPontos();

        notifyListeners();
        return;
      }
    }
    if (!_jogadas.contains(Jogador.vazio)) {
      vencedor = null;
      gameEnd = true;
      notifyListeners();
    }
  }

  Widget retornarContainer(index) {
    if (jogadas[index] == Jogador.o) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        width: 50,
        height: 50,
        child: const Icon(
          Icons.circle,
          size: 40,
          color: Colors.black,
        ),
      );
    } else if (jogadas[index] == Jogador.x) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.orange,
        ),
        width: 50,
        height: 50,
        child: const Icon(
          Icons.close,
          size: 40,
          color: Colors.black,
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        width: 50,
        height: 50,
      );
    }
  }

  void snackBar(context) {
    if (gameEnd == true && vencedor != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Fim de jogo!\nJogador ${cliques.isOdd ? "O" : "X"} venceu!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
    } else if (gameEnd == true && vencedor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Fim de jogo!\nEmpate!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.grey,
        ),
      );
    }
    notifyListeners();
  }

  void reiniciarBotao() {
    gameEnd = false;
    _jogadas = List.filled(9, Jogador.vazio);
    cliques = 0;
    jogadorAtual = Jogador.o;
    notifyListeners();
  }
}
