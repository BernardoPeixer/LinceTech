void main() {
  // Chamando classe ContaBancaria
  final contaBancaria = ContaBancaria(1000.00);

  // Valor de saque e depósito
  contaBancaria.sacar(300.00);
  contaBancaria.deposito(100.00);

  // Imprimindo saldo
  print("Saldo total: ${contaBancaria.saldo}");
}

  // Classe ContaBancaria
class ContaBancaria {
  ContaBancaria(this.saldo);
  double saldo;

  // Função para saque
  void sacar(double valor) {
    if(valor <= saldo) {
      saldo -= valor;
    } else {
      print("Dinheiro insuficiente");
    }
  }

  // Função para depósito
  void deposito(double valor) {
    valor += saldo;
  }
}