void main() {
  // Lista fornecida pelo usuário
  List<int> valorFornecido = [1,2,3,4,5,6,7,8,9,10];

  // Chamando função
  justOdd(valorFornecido);
}

  // Declarando função para somente imprimir ímpares da lista
void justOdd(List<int> a) {
  
  // Looping for para ímprimir somente se for ímpar
  for(int i = 0; i < a.length; i++) {
    if(a[i].isOdd) {
      print("Ímpar: ${a[i]}");
    }
  }
}