  void main() {
  final listaNomes = [
    "Joao",
    "Maria",
    "Pedro",
    "Maria",
    "Ana",
    "Joao",
    "Maria",
    "Fernanda",
    "Carlos",
    "Maria"
  ];

  final nome = 'Joao';
  final quantidade = contarNome(listaNomes, nome);

  if (quantidade == 1) {
    print('O nome $nome foi encontrado 1 vez');
  } else if (quantidade > 0) {
    print('O nome $nome foi encontrado $quantidade vezes');
  } else {
    print('O nome nao foi encontrado');
  }
}

int contarNome(List<String> nomes, String nome) {
  // Declarando variável quantidade
  int quantidade = 0;

  // Loop de comparação dos nomes
  for(int i = 0; i < nomes.length; i++) {
    if(nome == nomes[i]) {
      quantidade++;
    }
  }
  return quantidade;
}