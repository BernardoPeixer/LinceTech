void main() {
  // Try
  try {
    // Chamando classe e passando nome no parâmetro
    ArquivoTexto arquivoTexto = ArquivoTexto("codigo.txt");
    arquivoTexto.abrir();
    // Imprimindo erro
  } catch (e) {
    print(e);
    // Imprimir no fim do programa
  } finally {
    print("Fim do programa");
  }
}

// Classe abstrata
abstract class Arquivo {
  abrir();
}

// Classe ArquivoTexto implementando classe abstrata Arquivo
class ArquivoTexto implements Arquivo {
  ArquivoTexto(this.nome);
  final String nome;

// Sibrescrevendo função abrir
  @override
  void abrir() {
    //Try
    try {
      throw Exception("Erro ao abrir o arquivo.");
      // Relançando exception
    } catch (e) {
      print("Erro ao abrir o arquivo $nome");
      rethrow;
    }
  }
}