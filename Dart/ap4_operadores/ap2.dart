void main() {
  // Criando listas
  List<String> listaInicial = ['10', '2XXL7', 'JO0J', '99', '381', 'AD44', '47', '2B', '123', '78'];
  List<int>? listaConvertida = convertList(listaInicial);

  // Imprimindo Listas
  print('Lista convertida: ${listaConvertida.join(', ')}');
}

  // Função Converter String para Int
List<int> convertList(List<String> lista) {
  return lista.map((e) => int.tryParse(e) ?? 0).toList();
}