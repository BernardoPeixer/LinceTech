import 'dart:convert';

import 'package:exercicio_pratico_navegacao/model/pessoa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final path = join(
    await getDatabasesPath(),
    'pessoas.db',
  );

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TabelaPessoa.createTable);
    },
    version: 1,
  );
}

class TabelaPessoa {
  static const String createTable = '''
    CREATE TABLE $tableName(
      $id            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      $nome          TEXT NOT NULL,
      $email         TEXT NOT NULL,
      $telefone      TEXT NOT NULL,
      $tipoSanguineo TEXT NOT NULL,
      $link          TEXT NOT NULL
      
    );
    ''';

  static const String tableName = 'pessoa';

  static const String id = 'id';

  static const String nome = 'nome';

  static const String email = 'email';

  static const String telefone = 'telefone';

  static const String link = 'link';

  static const String tipoSanguineo = 'tiposanguineo';

  static Map<String, dynamic> toMap(Pessoa pessoa) {
    final map = <String, dynamic>{};

    map[TabelaPessoa.nome] = pessoa.nome;
    map[TabelaPessoa.email] = pessoa.email;
    map[TabelaPessoa.telefone] = pessoa.telefone;
    map[TabelaPessoa.link] = pessoa.link;
    map[TabelaPessoa.tipoSanguineo] = pessoa.tipoSanguineo.toString();

    return map;
  }
}

class PessoaController {
  Future<void> insert(Pessoa pessoa) async {
    final database = await getDatabase();
    final map = TabelaPessoa.toMap(pessoa);

    await database.insert(TabelaPessoa.tableName, map);

    return;
  }

  Future<void> delete(Pessoa pessoa) async {
    final database = await getDatabase();

    database.delete(
      TabelaPessoa.tableName,
      where: '${TabelaPessoa.id} = ?',
      whereArgs: [pessoa.id],
    );
  }

  Future<void> update(Pessoa pessoa) async {
    final database = await getDatabase();

    var map = TabelaPessoa.toMap(pessoa);

    await database.update(
      TabelaPessoa.tableName,
      map,
      where: '${TabelaPessoa.id} = ?',
      whereArgs: [pessoa.id],
    );
  }

  Future<List<Pessoa>> select() async {
    final database = await getDatabase();

    final List<Map<String, dynamic>> result =
        await database.query(TabelaPessoa.tableName);

    var list = <Pessoa>[];
    print('Result ######## ${jsonEncode(result)}');
    for (final item in result) {
      list.add(
        Pessoa(
          id: item[TabelaPessoa.id],
          nome: item[TabelaPessoa.nome],
          email: item[TabelaPessoa.email],
          telefone: item[TabelaPessoa.telefone],
          link: item[TabelaPessoa.link],
          tipoSanguineo: TipoSanguineo.values.firstWhere((element) =>
              element.toString() ==
              (item[TabelaPessoa.tipoSanguineo] ?? TipoSanguineo.aNegativo)),
        ),
      );
    }
    return list;
  }
}
