void main() {
  // Criação de lista e elemento
  List<int>? recebeElemento = [2,4,6,8,10];
  int? elemento = 10;

  // Imprimindo lista original com o elemento
  print("Lista original: $recebeElemento");

  // Chamando função
  recebeElemento = removeElemento(recebeElemento, elemento);

  // Imprimindo lista sem o elemento
  print("Lista modificada: $recebeElemento");
}

  // Função removendo elemento
List<int> removeElemento(List<int>? lista, [int? elemento]) {
  return (lista ?? [])..remove(elemento);
}