void main() async{
  // Chamando função pesquisar
  await pesquisar("Bolacha");

}

  // Função pesquisar com delay e retorno future void
Future<void> pesquisar(String digite) async{
  print("O usuário digitou: $digite");
  await Future.delayed(Duration(seconds: 1));
  print("Pesquisando por $digite no sistema...");
  await Future.delayed(Duration(seconds: 3));
  print("Temos 10 resultados referente a $digite no sistema.");
}