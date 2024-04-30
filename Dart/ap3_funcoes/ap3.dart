import 'dart:math';

// Calcula o raio
double calcularArea(int raio) {
  return 3.14 * raio * raio;
}

// Calcula perímetro
double calcularPerimetro(int raio) {
  return 2 * 3.14 * raio;
}

// Imprime as funções no modelo indicado
void printFunc(List<int> listaR, Function perim, Function area) {
  for (int i = 0; i < listaR.length; i++) {
    print("Raio: ${listaR[i]}, area: ${area(listaR[i])}, perímetro: ${perim(listaR[i])}");
  }
}

// Chama as funções
void main() {
  List<int> raios = List.generate(10, (index) => Random().nextInt(101) + 1);
  printFunc(raios, calcularPerimetro, calcularArea);
}