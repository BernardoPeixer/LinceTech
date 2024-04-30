void main() {
  // Criando produtos
  final produto1 = Produto("caneta", 10.0);
  final produto2 = Produto("borracha", 5.0);
  final produto3 = Produto("lapis", 2.0);
  final produto4 = Produto("tesoura", 13.0);
  final produto5 = Produto("apontador", 8.0);

  // Criando lista de produtos
  List<Produto> produtos = [produto1,produto2,produto3,produto4,produto5];

  // Loop for para imprimir os resultados
  for(int i = 0; i < produtos.length; i++) {
    print("Novo preço do produto ${produtos[i].nome} ${produtos[i].desconto(20)}");
  }
}

  // Classe produto
class Produto {
  Produto(this.nome, this.preco);
  String nome;
  double preco;

  // Função desconto
  double desconto(int desconto) {
    return preco - (preco / 100 * desconto);
  }
}