Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  print("Baixando imagens...");

  // Função baixarImagens
  await baixarImagens(urls);

  print("Download concluído!");
}

  Future<void> baixarImagens(List<String> urls) async{
    // Loop for
    for(int i = 0; i < urls.length; i++) {
      // Nome da imagem
      String nomeImagem = 'imagem${i + 1}.jpg';
      // Simula atraso no download
      await Future.delayed(Duration(seconds: 1));
      // Imprimindo resultado
      print("Imagem <$nomeImagem> baixada com seucesso!");
    }
  }