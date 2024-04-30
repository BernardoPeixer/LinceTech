import 'dart:math';

void main() {
  // Criando Instância Random
  Random random = Random();

  // Criando randomList
  List<int> randomList = List.generate(50, (index) => random.nextInt(12) + 10);

  // Imprimindo Lista Original (Separados Por ;)
  print("Lista original: ${randomList.join('; ')}");

  // Criando setVar
  var setVar = {...randomList};

  // Imprimindo setVar (Separados Por ;)
  print("Itens únicos: ${setVar.join('; ')}");
}