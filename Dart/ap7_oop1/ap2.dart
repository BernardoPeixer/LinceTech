import 'dart:math';

void main() {
  // Criando instância random
  Random random = Random();

  // Criando retângulo com medidas aleatórias
  Retangulo retangulo = Retangulo(random.nextDouble()*30,random.nextDouble()*30);

  // Variável de área
  double area = retangulo.calcularArea();

  // Impirmindo resultado
  print("Área do retângulo: ${area.toStringAsFixed(2)}");
}

  // Classe retângulo
class Retangulo {
  Retangulo(this.largura, this.altura);
  final largura;
  final altura;

  // Função calculo de área
  double calcularArea() {
    return largura * altura;
  }
}