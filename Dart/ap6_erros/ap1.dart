void main(args) {
  // Try
  try{
    erroArgs(args[0]);
  } catch (e) {
    print("Entrada invalida. Insira apenas números inteiros");
  }
}

// Função Parse
void erroArgs(args) {
 int numero = int.parse(args);
 print("Número digitado: $numero");
}