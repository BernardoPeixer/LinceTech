import 'dart:math';

  // Enum de generos
enum GeneroMusical {
  pagode,
  rap,
  funk,
  pop,
  internacional,
  sertanejo,
}

void main() {
  // Classe random
  Random random = Random();

  // Indice aleatório
  var indiceAleatorio = random.nextInt(GeneroMusical.values.length);
  // Nome do indice gerado
  var generoRandom = GeneroMusical.values[indiceAleatorio].name;

  // Imprimindo resultado
  print("Meu gênero musical preferido é $generoRandom");
}