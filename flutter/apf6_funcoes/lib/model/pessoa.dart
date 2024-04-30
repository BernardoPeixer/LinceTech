// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import '../controller/database.dart';

class Pessoa {
  Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.link,
    required this.tipoSanguineo,
    this.id,
  });

  final String nome;
  final String email;
  final String telefone;
  final String link;
  final TipoSanguineo? tipoSanguineo;
  late int? id;
}

class EstadoListaDePessoas with ChangeNotifier {
  EstadoListaDePessoas({this.pessoa}) {
    load();

    if (pessoa != null) {
      populaFormulario(pessoa!);
    }
  }

  final Pessoa? pessoa;

  Pessoa? _pessoaAtual;

  Pessoa? get pessoaAtual => _pessoaAtual;

  final _listaDePessoas = <Pessoa>[];

  List<Pessoa> get listaDePessoas => _listaDePessoas;

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);

    notifyListeners();
  }

  void updateTipoSanguineo(TipoSanguineo novoValor) {
    _tipoSanguineoSelecionado = novoValor;
    notifyListeners();
  }

  final controller = PessoaController();

  final _controllerNome = TextEditingController();

  final _controllerEmail = TextEditingController();
  final _controllerTelefone = TextEditingController();
  final _controllerLink = TextEditingController();

  TextEditingController get controllerNome => _controllerNome;
  TextEditingController get controllerEmail => _controllerEmail;
  TextEditingController get controllerTelefone => _controllerTelefone;
  TextEditingController get controllerLink => _controllerLink;

  TipoSanguineo? _tipoSanguineoSelecionado;
  TipoSanguineo? get tipoSanguineoSelecionado => _tipoSanguineoSelecionado;

  Future<void> insert() async {
    print('chamando insert');
    final pessoa = Pessoa(
      nome: controllerNome.text,
      email: controllerEmail.text,
      telefone: controllerTelefone.text,
      link: controllerLink.text,
      tipoSanguineo: tipoSanguineoSelecionado,
    );
    print('######### ${pessoa.tipoSanguineo}');
    await controller.insert(pessoa);
    await load();

    controllerNome.clear();
    controllerEmail.clear();
    controllerTelefone.clear();
    controllerLink.clear();
    _tipoSanguineoSelecionado = null;
    notifyListeners();
    print('insert concluido');
  }

  Future<void> delete(Pessoa pessoa) async {
    await controller.delete(pessoa);
    await load();

    notifyListeners();
  }

  Future<void> load() async {
    final lista = await controller.select();

    _listaDePessoas.clear();
    _listaDePessoas.addAll(lista);

    notifyListeners();
  }

  void populaFormulario(Pessoa pessoa) {
    print('aqui++++++++++++');
    // Inserir no ícone editar na tela de listagem!!!
    _controllerNome.text = pessoa.nome ?? '';
    _controllerEmail.text = pessoa.email ?? '';
    _controllerTelefone.text = pessoa.telefone ?? '';
    _controllerLink.text = pessoa.link ?? '';
    _tipoSanguineoSelecionado = pessoa.tipoSanguineo;

    _pessoaAtual = Pessoa(
        nome: pessoa.nome,
        email: pessoa.email,
        telefone: pessoa.telefone,
        link: pessoa.link,
        tipoSanguineo: pessoa.tipoSanguineo,
        id: pessoa.id);
  }

  Future<void> updatePessoa() async {
    // Inserir método no botão salvar na tela de edição!!!
    final pessoaEditada = Pessoa(
      id: _pessoaAtual?.id,
      nome: controllerNome.text,
      email: controllerEmail.text,
      telefone: controllerTelefone.text,
      link: controllerLink.text,
      tipoSanguineo: tipoSanguineoSelecionado,
    );

    await controller.update(pessoaEditada);

    _pessoaAtual = null;

    _controllerNome.clear();
    _controllerEmail.clear();
    _controllerTelefone.clear();
    _controllerLink.clear();
    _tipoSanguineoSelecionado = null;

    await load();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo;

  String get tipo => switch (this) {
        TipoSanguineo.aPositivo => 'A+',
        TipoSanguineo.aNegativo => 'A-',
        TipoSanguineo.bPositivo => 'B+',
        TipoSanguineo.bNegativo => 'B-',
        TipoSanguineo.oPositivo => 'O+',
        TipoSanguineo.oNegativo => 'O-',
        TipoSanguineo.abPositivo => 'AB+',
        TipoSanguineo.abNegativo => 'AB-',
      };
}
