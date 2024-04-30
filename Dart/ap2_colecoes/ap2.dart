import 'dart:math';

void main() {
  // Criando Instância Random
  Random random = Random();

  // Criando randomList
  List<int> randomList = List.generate(50, (index) => random.nextInt(16));

  // Imprimindo randomList (Separados Por ;)
  print("Lista original: ${randomList.join('; ')}");

  // Removendo Números Pares
 randomList.removeWhere((element) => element % 2 == 0 );

 // Atribuindo A Lista Modificada A listaAtt
 var listaAtt = randomList;

  // Imprimindo Lista Atualizada (Separados Por ;)
  print("Lista Atualizada: ${listaAtt.join('; ')}");
}