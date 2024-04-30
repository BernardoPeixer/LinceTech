import 'dart:math';

 // Função A recebe outra Função como parâmetro
 int funcA(int Function(int) func) {
  // Executa a função recebida duas vezes com números aleatórios
  var num1 = Random().nextInt(10) + 1;
  var num2 = Random().nextInt(10) + 1;
  var result1 = func(num1);
  var result2 = func(num2);
  // Retorna a soma das duas execuções da função parâmetro
  return result1 + result2;
 }

  // Função B que recebe número como parámetro
  int funcB(int num) {
    return num * 2;
  }

  // Função C que retorna o seu quadrado
  int funcC(int num) {
    return num * num;
  }

void main() {
  // Executa a Função A passando a Função B como parâmetro
  var resultAB = funcA(funcB);
  //Executa a Função A passando a Função C como parâmetro
  var resultAC = funcA(funcC);

  // Imprime os resultados
  print('Resultado de funcA(funcB): $resultAB');
  print('Resultado de funcA(funcC): $resultAC');
}