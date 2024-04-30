import 'dart:math';

void main() {
  Random random = Random();

  List<int> tempList = List.generate(15, (index) => random.nextInt(15) +1);

  printNumeros(tempList);
}

void printNumeros(List<int> numeros) {
  numeros.sort();

  // Retorna o número recebido em sua representação binaria
String converterParaBinario(int numero) => numero.toRadixString(2);

// Retorna o número recebido em sua representação octal
String converterParaOctal(int numero) => numero.toRadixString(8);

// Retorna o número recebido em sua representação hexadecimal
String converterParaHexadecimal(int numero) => numero.toRadixString(16);

  for (final decimal in numeros) {
    print(
      'decimal: $decimal, '
      'binário: ${converterParaBinario(decimal)}, '
      'octal: ${converterParaOctal(decimal)}, '
      'hexadecimal: ${converterParaHexadecimal(decimal)}',
    );
}
}