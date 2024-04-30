void main(args) {
  //Try 
  try {
    numPar(int.parse(args[0]));
  } on isEvenException catch (e){
    print("$e Entrada inválida. Insira apenas números pares.");
  } catch (e){
    print("Ouve um erro");
  };
}

  // Função 
void numPar(int numero) {
  if(numero.isEven) {
    print("Entrada correta, você inseriu um número par.");
  }

  if(numero.isOdd) {
    throw isEvenException();
  }
}

  // Exceção
class isEvenException implements Exception {}