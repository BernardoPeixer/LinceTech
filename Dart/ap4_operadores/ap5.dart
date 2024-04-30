void main() {
  // Criação do map (usamos dynamic pois o value tem retorno int ou string)
  Map<String, dynamic> pessoasIdades = Map<String, int?>();
  pessoasIdades['Nelson'] = null;
  pessoasIdades['Jane'] = null;
  pessoasIdades['Jack'] = 16;
  pessoasIdades['Rupert'] = 37;
  pessoasIdades['Andy'] = 13;
  pessoasIdades['Kim'] = 27;
  pessoasIdades['Robert'] = 31;

  // Chamando função
  nomeIdade(pessoasIdades);
}

  // Função usada para imprimir
void nomeIdade(Map<String, dynamic> map) {
  map.forEach((key, values) {
    values ??= 'idade não informada';
    print("${key} - $values");
  });
}