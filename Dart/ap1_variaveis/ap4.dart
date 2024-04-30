import 'dart:math';

void main() {
  // Criando Instância Random
  Random random = Random();

  // Definindo Variáveis 
  int numero1 = random.nextInt(100) + 1;
  int numero2 = random.nextInt(100) + 1;

  // Divisão e Variável Resultado
  double resultado = (numero1 / numero2);

  // Salvando Parte Inteira
  int parteInteira = resultado.toInt();

  // Salvando Parte Decimal
  double parteDecimal = resultado - parteInteira;

  // Imprimindo Variáveis
  print("Primeira variável: $numero1");
  print("Segunda variável: $numero2");
  print("Resultado da divisão: $resultado");
  print("Parte inteira do resultado: $parteInteira");
  print("Parte decimal do resultado: $parteDecimal");
}