void main() {
  // Criando variáveis
  String produto = "Caneta";
  int preco = 10;
  int desconto = 30;
  // Chamando função de desconto
  dandoDesconto(preco, produto, desconto);
}

void dandoDesconto(int preco, String produto, int desconto) {
  // Criando preço novo
  double novoPreco = preco - (preco / 100 * desconto);
  // Imprimindo resultado
  print("O produto $produto custava $preco reais, foi vendido por $novoPreco reais. O desconto dado foi $desconto%");
}