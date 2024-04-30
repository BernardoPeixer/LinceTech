void main() async{
  print('Iniciando lançamento');

  // Função lancarFoguete
  await lancarFoguete();

  print('Foguete lançado!');
}

 Future<void> lancarFoguete() async{
  // Loop for
  for(int i = 10; i >= 1; i--) {
    // Delay por segundo
    await Future.delayed(Duration(seconds: 1));
    // Lançamento do foguete!
    print("Lançamento em $i segundos!");
  }
 }