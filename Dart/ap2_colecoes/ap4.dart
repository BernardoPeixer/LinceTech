void main() {
  // Criando Map
  Map<String, List<String>> mapaPais = Map<String, List<String>>();

  // Adicionando Estados E Cidades
  mapaPais['SC'] = ['Blumenau', 'Gaspar', 'Florianopolis'];
  mapaPais['PR'] = ['Curitiba', 'Foz do Iguaçu', 'Cascavel'];
  mapaPais['SP'] = ['Sao Paulo', 'Guarulhos', 'Campinas'];
  mapaPais['MG'] = ['Belo Horizonte', 'Juiz de Fora', 'Berlinda'];

  // Ordenando Estados Em Ordem Alfabética
  var keysOrdenadas = mapaPais.keys.toList()..sort();

  // Imprimindo Exercício1
  print("Estados: ${keysOrdenadas.join('; ')}");

  // Criando Variáveis Exercicio2
  var estadoDesejado = 'SC';
  var cidadesSc = mapaPais[estadoDesejado] ?? [];
  cidadesSc.sort();

  // Imprimindo Exercício2
  print("Cidades de $estadoDesejado: ${cidadesSc.join(', ')}");

 // Imprimindo Exercicio3
  keysOrdenadas.forEach((estado) {
    mapaPais[estado]!.sort(); // Ordena a lista de cidades
    mapaPais[estado]!.forEach((cidade) {
      print('$estado - $cidade');
    });
  });
}

