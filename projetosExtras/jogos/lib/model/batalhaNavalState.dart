import 'package:flutter/material.dart';
import 'dart:math';

class BatalhaNavalState with ChangeNotifier {
  List<bool> visibilidadeQuadradosInimigo = List.generate(100, (index) => true);
  List<bool> visibilidadeQuadradosMeus = List.generate(100, (index) => true);
  List<int> jogadasComputador =
      List.generate(100, (index) => Random().nextInt(100));
  List<Color> coresAdversario = List.generate(100, (index) => Colors.white);
  List<Color> coresMinhas = List.generate(100, (index) => Colors.white);
                      int minhasTentativas = 0;
                      int tentativasComputador = 0;
  List<int> posicoesMeusNavios = [];
  List<int> posicoesInimigoNavios = [];
  int naviosEncontrados = 0;
  bool jogoEncerrado = false;


  int naviosEncontradosJogador = 0;
  int naviosEncontradosComputador = 0;

  BatalhaNavalState() {
    posicoesMeusNavios = gerarNavios();
    posicoesInimigoNavios = gerarNavios();
  }

  void jogadaComputador() {
    // Verifica se o jogo está encerrado ou se o computador já atingiu todas as posições possíveis
    print('Tentativas do computador: $tentativasComputador');
    if (jogoEncerrado || tentativasComputador >= 100) {
      print('Jogo encerrado ou tentativas do computador excedidas');
      return;
    }

    int jogada;
    do {
      jogada = Random().nextInt(100);
      
    } while (!visibilidadeQuadradosMeus[jogada]);

    // Marca a jogada do computador no tabuleiro do jogador
    visibilidadeQuadradosMeus[jogada] = false;

    // Verifica se o computador acertou um navio do jogador
    bool acertou = posicoesMeusNavios.contains(jogada);
    if (acertou) {
      naviosEncontradosComputador++;
      verificarFimDeJogo();
      coresMinhas[jogada] = Colors.black;
      jogadaComputador();
      return;
    }

    coresMinhas[jogada] = Colors.grey;
    tentativasComputador++;
    notifyListeners();
  }

  List<int> gerarNavios() {
    List<int> posicoesNavios = [];
    final random = Random();
    while (posicoesNavios.length < 10) {
      int posicao = random.nextInt(100);
      if (!posicoesNavios.contains(posicao)) {
        posicoesNavios.add(posicao);
      }
    }
    return posicoesNavios;
  }

  void verificarFimDeJogo() {
    // Verifica se o jogador encontrou 10 navios no tabuleiro dele
    int naviosJogadorEncontrados = 0;
    for (int posicao in posicoesInimigoNavios) {
      if (!visibilidadeQuadradosInimigo[posicao]) {
        naviosJogadorEncontrados++;
      }
    }
    bool jogadorGanhou = naviosJogadorEncontrados >= 10;

    // Verifica se o computador encontrou 10 navios no tabuleiro dele
    int naviosComputadorEncontrados = 0;
    for (int posicao in posicoesMeusNavios) {
      if (!visibilidadeQuadradosMeus[posicao]) {
        naviosComputadorEncontrados++;
      }
    }
    bool computadorGanhou = naviosComputadorEncontrados >= 10;

    // Verifica se o jogo deve encerrar
    jogoEncerrado = jogadorGanhou || computadorGanhou;

    print('Jogo encerrado? $jogoEncerrado');
  }

  Container inimigoTabuleiro(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 315,
        child: GridView.builder(
          itemCount: 100, // 10x10 grid
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            bool temNavio = posicoesInimigoNavios.contains(index);
            bool acertou = !visibilidadeQuadradosInimigo[index] && temNavio;
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: coresAdversario[index],
                  border: Border.all(),
                ),
                child: Center(
                  child: Visibility(
                    visible: !visibilidadeQuadradosInimigo[index],
                    child: Text(
                      acertou ? 'X' : '',
                      style: TextStyle(
                          color: acertou ? Colors.red : Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              onTap: () {
                if (jogoEncerrado || !visibilidadeQuadradosInimigo[index])
                  return;

                bool temNavio = posicoesInimigoNavios.contains(index);
                bool acertou = temNavio;

                // Mostra o X imediatamente se o jogador acertou um navio inimigo
                if (acertou) {
                  coresAdversario[index] = Colors.black;
                  visibilidadeQuadradosInimigo[index] = false;
                  minhasTentativas++;
                  naviosEncontradosJogador++;
                  verificarFimDeJogo();
                } else {
                  coresAdversario[index] = Colors.grey;
                  visibilidadeQuadradosInimigo[index] = false;
                  minhasTentativas++;
                }

                // Se o jogo não acabou e o jogador não acertou um navio, avança para a jogada do computador
                if (!jogoEncerrado && !acertou) {
                  jogadaComputador();
                }

                notifyListeners();
              },
            );
          },
        ),
      ),
    );
  }

  Container meuTabuleiro(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 315,
        child: GridView.builder(
          itemCount: 100, // 10x10 grid
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            bool temNavio = posicoesMeusNavios.contains(index);
            bool acertou = !visibilidadeQuadradosMeus[index] && temNavio;
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: visibilidadeQuadradosMeus[index]
                      ? (temNavio ? Colors.black : Colors.white)
                      : Colors.grey,
                ),
                child: Center(
                  child: Visibility(
                    visible: !visibilidadeQuadradosMeus[index],
                    child: Text(
                      acertou ? 'X' : '',
                      style: TextStyle(
                          color: acertou ? Colors.red : Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
