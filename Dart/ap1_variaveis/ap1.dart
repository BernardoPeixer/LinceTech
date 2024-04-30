// ignore_for_file: dead_code, unnecessary_null_comparison

void main() {
  // Definindo variáveis
  String nome = "Bernardo";
  String sobrenome = "Peixer";

  int idade = 15;
  bool maiorIdade = idade >= 18;

  bool ativo = false;

  double peso = 65.3;

  String? nacionalidade = "Brasileiro";

  // Interpolando variáveis
  String nomeCompleto = "Nome completo: $nome $sobrenome";
  String idadeConferencia = "Idade: $idade. Maior de Idade: $maiorIdade";
  String pesoPrint = "Peso: $peso";

  // Imprmindo Variáveis
  print(nomeCompleto);
  print(idadeConferencia);
  print(pesoPrint);

  // Conferindo Booleano
  if (ativo) {
    print("Situação: ativo");
  } else {
    print("Situação: inativo");
  }

  // Conferindo Nacionalidade

  if (nacionalidade == null) {
    print("Nacionalidade: não informada");
  } else {
    print("Nacionalidade: $nacionalidade");
  }
}