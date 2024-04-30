import 'dart:math';

void main() {
  // Criando Instância Random
  Random random = Random();

  // Declarando Variáveis Aleatórias
  final int numero1 = random.nextInt(101);
  final int numero2 = random.nextInt(101);

  // Imprimindo Valores Originais
  print("O valor original do número 1 é: $numero1");
  print("O valor original do número 2 é: $numero2");

  // Invertendo Valores
  final int temp = numero1;
  final int numero1Invertido = numero2;
  final int numero2Invertido = temp;

  // Imprimindo Valores Invertidos
  print("O valor invertido do número 1 é: $numero1Invertido");
  print("O valor invertido do número 2 é: $numero2Invertido");
}