import 'dart:math';

void main() {

  // Declarando lista
  List<int> numerosAleatorios = [];

  // Criando instância random
  Random random = Random();

  // Loop para adicionar numeros aleatorios para a lista
  for(int i = 0; i < 5; i++) {
    numerosAleatorios.add(random.nextInt(26) + 1);
  }

  // Loop para imprimir as letras
  for(int numero in numerosAleatorios) {
    print("Numero $numero -> Letra ${numberToLetter(numero)}");
  }
}

  // Declarando função
  String numberToLetter(int numero) {

    // Loop para converter código ASCII para letra
    if(numero < 1 || numero > 26) {
      print("Número inválido");
    }
    return String.fromCharCode(64 + numero);
  }