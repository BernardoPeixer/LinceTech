import 'dart:math';

  // Classe abstrata
abstract class Calculadora {
  // Método estático 
  static int dobro(int valor) {
    return valor * 2;
  }
}

void main() {
  // Instância Random
  Random random = Random();
  // Número gerado aleatóriamente
  int randomValor = random.nextInt(100);
  // Imprimindo resultados
  print("O dobro do número $randomValor é: ${Calculadora.dobro(randomValor)}");
}