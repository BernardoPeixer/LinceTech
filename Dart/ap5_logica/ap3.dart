import 'dart:math';

void main() {

  // Criando instância random
  Random random = Random();

  // Declarando número aleatório entre 100 e 1000
  int numeroFornecido = random.nextInt(901) + 100;

  // Imprimindo o número aleatório fornecido
  print("O número fornecido é: $numeroFornecido");

  // Declarando variável resultado 
  int resultado = somaPar(numeroFornecido);

  // Imprimindo resultado
  print("A soma dos números pares até o $numeroFornecido é igual a: $resultado");
}

  // Função somaPar
  int somaPar(int numeroFornecido) {

    // Declarando variavel soma
    int soma = 0;

    // Loop para o índice pegar do 0 até o número fornecido
    for (int i = 0; i <= numeroFornecido; i++) {
      if(i.isEven) {
        soma += i;
      }
    }

    // Retorno soma
    return soma;
  }