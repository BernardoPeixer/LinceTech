import 'dart:math';

void main() {
  // Criando instância random
  Random random = Random();
  // Lista de pessoas
  List<Pessoa> pessoas = [
    Pessoa("Bernardo", random.nextInt(101), random.nextDouble()*1.3 + 1),
    Pessoa("Filipe", random.nextInt(101), random.nextDouble()*1.3 + 1),
    Pessoa("Jaime", random.nextInt(101), random.nextDouble()*1.3 + 1),
    Pessoa("Vanessa", random.nextInt(101), random.nextDouble()*1.3 + 1),
    Pessoa("Monique", random.nextInt(101), random.nextDouble()*1.3 + 1),
    ];
  // Imprimindo resultado
  print("Informação das pessoas:");
  for(int i = 0; i < pessoas.length; i++) {
    Pessoa pessoa = pessoas[i];
    print("Nome: ${pessoa.nome}");
    print("Idade: ${pessoa.idade}");
    print("Altura: ${pessoa.altura.toStringAsFixed(2)}");
    print("");
  }
}
// Classe pessoa
class Pessoa {
  late int _idade;
  // get
  int get idade {
    return _idade;
  }
  // set
  set idade(int idade) {
    if(idade >= 0) {
      _idade = idade;
    }
  }

  late double altura;
  late String nome;

  Pessoa(this.nome, this._idade, this.altura);
}