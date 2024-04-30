import 'dart:math';

void main() {
  try {
  // Criando instância random
  Random random = Random();

  // Definindo base e altura
  double altura = random.nextDouble()*99;
  double base = random.nextDouble()*99;

  // Chamando classe Retângulo
  Retangulo retangulo = Retangulo(base, altura);
  double area = retangulo.calcularArea();
  print("Área do retângulo: ${area.toStringAsFixed(2)}");
  } on Exception catch (e) {
    print(e);
  }
}

  // Classe abstrata
  abstract class Forma {
    calcularArea();
  }

  // Classe retangulo implementando forma
  class Retangulo implements Forma {
    late double base;
    late double altura;

  // Tratando erro
    Retangulo(this.base, this.altura) {
      if(base <= 0 || altura <= 0) {
        throw Exception("Dimensões inválidas, informe apenas valores positivos maiores que zero");
      }
    }

  // Sobrescrevendo a função calcularArea
    @override
    calcularArea() {
      return base * altura;
    }
}