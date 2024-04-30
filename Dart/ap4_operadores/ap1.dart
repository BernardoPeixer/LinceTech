void main() {
  // Ano de entrada
  int anoInformado = 2024;

  // Chamando função
  funcBissexto(anoInformado);
}

  // Função para ano bissexto
  void funcBissexto(int ano) {
    if (ano % 4 == 0) {
      if (ano % 100 != 0 || ano % 400 == 0) {
          print("O ano $ano é bissexto");
      } else {
          print("O ano $ano não é bissexto");
      }
  } else {
      print("O ano $ano não é bissexto");
  }
}