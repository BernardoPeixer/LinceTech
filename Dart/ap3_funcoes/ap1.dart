// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

// Criando Função printRandom
void printRandom(List<num> lista) {
  print("Lista: ${lista.join(', ')}");
}

// Função somaList
void somaList(List<num> lista1, List<num> lista2) {
  // Validações
  if((lista1 == null || lista2 == null) || (lista1.length != lista2.length)) {
    throw ArgumentError('As listas devem haver o mesmo tamanho.');
  }
  
  // Imprimindo Listas
  print("Lista: ${lista1.join(', ')}");
  print("Lista: ${lista2.join(', ')}");

  // Exibindo Operações
  print("\nSomas");
  for (int i = 0; i < lista1.length; i++) {
    print("${lista1[i]} + ${lista2[i]} = ${lista1[i] + lista2[i]}");
  }

  // Variável Lista Somada
  List<num> soma = [];

  // Juntando Listas
  for(int i = 0; i < lista1.length; i++) {
    soma.add(lista1[i] + lista2[i]);
  }

  // Imprimindo Lista Somada
  print("Lista: ${soma.join(', ')}");
}



void main() {
  // Criando Instância Random
  Random random = Random();

  // Criando Lista
  List<num> listaRandom1 = List.generate(5, (index) => random.nextInt(101));
  List<num> listaRandom2 = List.generate(5, (index) => random.nextInt(101));  

  // Imprimindo Funções Com Parâmetro
  print("IMPRIMINDO LISTA");
  print("--------------------------------------------");
  printRandom(listaRandom1);
  print("--------------------------------------------");
  print("\nLISTA SOMADA");
  print("--------------------------------------------");
  somaList(listaRandom1, listaRandom2);
}
  

