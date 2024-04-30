// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:exercicio_pratico_navegacao/model/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../view/pagina_listagem.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  var richBlack = Color.fromRGBO(0, 23, 31, 1);

  var cinereous = Color.fromRGBO(145, 140, 140, 1);

  var cinereousLight = Color.fromRGBO(146, 145, 145, 1);

  var mintGreen = Color.fromRGBO(201, 251, 255, 1);

  var gunMetal = Color.fromRGBO(0, 46, 61, 0.5);

  bool _iconeExpandir = false;

  String a = TipoSanguineo.aPositivo.name;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EstadoListaDePessoas(),
      child: Scaffold(
        backgroundColor: richBlack,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          title: Text(
            'LISTA DE PESSOAS',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: gunMetal,
        ),
        body: Consumer<EstadoListaDePessoas>(
          builder: (context, state, _) {
            return ListView.builder(
              itemCount: state.listaDePessoas.length,
              itemBuilder: (context, indice) {
                final pessoa = state.listaDePessoas[indice];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  child: Card(
                    key: ValueKey(state.listaDePessoas[indice].id),
                    color: Colors.grey,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ExpansionTile(
                      title: Text(
                        state.listaDePessoas[indice].nome,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: mintGreen,
                        ),
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/editPage',
                                arguments: state.listaDePessoas[indice],
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              state.delete(pessoa);
                            },
                          ),
                        ],
                      ),
                      children: [
                        ListTile(
                          tileColor: cinereousLight,
                          title: Text(
                            'Email: ${state.listaDePessoas[indice].email}\nFone: ${state.listaDePessoas[indice].telefone}\nGitHub: https://github/${state.listaDePessoas[indice].link}',
                            style: TextStyle(color: mintGreen),
                          ),
                          leading: Text(
                            state.listaDePessoas[indice].tipoSanguineo?.tipo ??
                                'Tipo sanguineo indefinido',
                            style: TextStyle(
                              color: mintGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
