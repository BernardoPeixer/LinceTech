import 'dart:math';

void main() {
  // Criando Instância Random
  Random random = Random();

  //Declarando Lista Aleatória
  var list = [random.nextInt(101), random.nextInt(101), random.nextInt(101), random.nextInt(101), random.nextInt(101),
  random.nextInt(101), random.nextInt(101), random.nextInt(101), random.nextInt(101), random.nextInt(101)];

  // Jeito Simples De Declarar
  // var list = List.generate(10, (index) => random.nextInt(101));

  // Imprimindo Posição + Valor
  list.asMap().forEach((index, element) => print("Posição: $index Valor: $element"));
}