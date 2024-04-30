// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_build_context_synchronously, sort_child_properties_last, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, must_be_immutable, unnecessary_new

import 'package:exercicio_pratico_navegacao/main.dart';
import 'package:exercicio_pratico_navegacao/model/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddUsers extends StatelessWidget {
  AddUsers({super.key});

  final _keyForm = GlobalKey<FormState>();
  var richBlack = Color.fromRGBO(0, 23, 31, 1);

  var gunMetal = Color.fromRGBO(0, 46, 61, 0.5);

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  String? validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    if (!value.contains('@')) {
      return 'Email inválido';
    }
    return null;
  }

  String? validatorPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    if (value.length < 20) {
      return 'Telefone inválido';
    }
    return null;
  }

  final maskFormatterPhone = MaskTextInputFormatter(
    mask: '+## (##) # ####-####',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: richBlack,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Text(
          'CADASTRO DE PESSOAS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: gunMetal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Informe os dados abaixo:',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ChangeNotifierProvider<EstadoListaDePessoas>(
                    create: (_) => EstadoListaDePessoas(),
                    child: Consumer<EstadoListaDePessoas>(
                        builder: (context, state, _) {
                      return Form(
                        key: state.formKey,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              validator: validator,
                              controller: state.controllerNome,
                              decoration: InputDecoration(
                                labelText: 'Nome completo',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: validatorEmail,
                              controller: state.controllerEmail,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                hintText: 'example@example.com',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: validator,
                              controller: state.controllerLink,
                              decoration: InputDecoration(
                                prefixText: 'https://github.com/',
                                labelText: 'Link do GitHub',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              validator: validatorPhone,
                              controller: state.controllerTelefone,
                              decoration: InputDecoration(
                                labelText: 'Telefone',
                                hintText: '+55 (11) 9 1111-1111',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              inputFormatters: [maskFormatterPhone],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DropdownButton(),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: BotaoEnviar(),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownButton extends StatelessWidget {
  DropdownButton({super.key});

  String? _validateDropdown(TipoSanguineo? value) {
    print(value);
    if (value == null) {
      return 'Por favor, selecione um item';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<EstadoListaDePessoas>(
        builder: (context, state, _) {
          return DropdownButtonFormField<TipoSanguineo>(
            decoration: InputDecoration(
              hintText: ('Tipo sanguíneo'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            value: state.tipoSanguineoSelecionado,
            validator: _validateDropdown,
            onChanged: (newValue) {
              if (newValue != null) {
                // Verifica se o valor não é nulo
                state.updateTipoSanguineo(newValue);
              }
            },
            items: TipoSanguineo.values.map((TipoSanguineo tipo) {
              return DropdownMenuItem<TipoSanguineo>(
                value: tipo,
                child: Text(tipo.toString().split('.').last),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class BotaoEnviar extends StatelessWidget {
  BotaoEnviar({super.key});
  var blue = Color.fromRGBO(47, 84, 255, 1);
  var murrey = Color.fromRGBO(149, 9, 82, 1);
  @override
  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(builder: (context, state, _) {
      return ElevatedButton(
        onPressed: () async {
          if (state.formKey.currentState!.validate()) {
            await state.insert();
            Navigator.pushNamed(context, '/listPage');
          }
        },
        child: Center(
          child: Text(
            'Cadastrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: murrey),
      );
    });
  }
}
