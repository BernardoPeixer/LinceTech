import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/loginState.dart';

Future<Database> getDatabase() async {
  final path = join(
    await getDatabasesPath(),
    'usuario.db',
  );

  final database = await openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TabelaUsuario.createTable);
    },
    version: 1,
  );

  // Verifica se a tabela já existe
  var tableExists = await database.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='${TabelaUsuario.tableName}'");

  // Se a tabela não existir, crie-a
  if (tableExists.isEmpty) {
    await database.execute(TabelaUsuario.createTable);
  }

  return database;
}

class TabelaUsuario {
  static const String createTable = '''
    CREATE TABLE $tableName (
      $id     INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      $nome   TEXT NOT NULL,
      $email  TEXT NOT NULL,
      $senha  TEXT NOT NULL
    );
    ''';

  static const String tableName = 'usuario';
  static const String id = 'id';
  static const String nome = 'nome';
  static const String senha = 'senha';
  static const String email = 'email';

  static Map<String, dynamic> toMap(Usuario usuario) {
    final map = <String, dynamic>{};

    map[TabelaUsuario.email] = usuario.email;
    map[TabelaUsuario.senha] = usuario.senha;
    map[TabelaUsuario.nome] = usuario.nome;

    return map;
  }
}

class UsuarioController {
  Future<void> insert(Usuario usuario) async {
    final database = await getDatabase();

    final map = TabelaUsuario.toMap(usuario);

    await database.insert(TabelaUsuario.tableName, map);

    return;
  }

  Future<List<Usuario>> select() async {
    final database = await getDatabase();

    final List<Map<String, dynamic>> result = await database.query(
      TabelaUsuario.tableName,
    );

    var list = <Usuario>[];

    for (final item in result) {
      list.add(
        Usuario(
          id: item[TabelaUsuario.id],
          nome: item[TabelaUsuario.nome],
          email: item[TabelaUsuario.email],
          senha: item[TabelaUsuario.senha],
        ),
      );
    }

    return list;
  }
}
