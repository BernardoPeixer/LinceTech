// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/loginState.dart';

class Login extends StatelessWidget {
  Login({super.key});

  Color color = Color.fromRGBO(1, 14, 33, 1);
  Color color2 = Color.fromARGB(255, 12, 44, 92);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Consumer<LoginState>(builder: (context, state, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Image.asset(
                  'assets/playstore.png',
                  width: MediaQuery.of(context).size.width / 3,
                ),
              ),
            ),
            Form(
              key: state.keyForm,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      controller: state.controllerEmail,
                      validator: state.validatorEmail,
                      decoration: InputDecoration(
                          hintText:
                              state.login ? 'e-mail ou apelido' : 'e-mail',
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          fillColor: Colors.white),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: state.controllerSenha,
                      validator: state.validatorSenha,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'senha',
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          fillColor: Colors.white),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Visibility(
                      visible: !state.login,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: state.validatorConfirmaSenha,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            controller: state.controllerConfirmaSenha,
                            decoration: InputDecoration(
                                hintText: 'confirme a senha',
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                fillColor: Colors.white),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            // validator: state.validatorNome,
                            controller: state.controllerNome,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'apelido',
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                fillColor: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(color2),
                        ),
                        onPressed: () async {
                          await state.validarLoginCadastro(context);
                        },
                        child: Text(
                          state.login ? 'CONECTAR' : 'CRIAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(color),
                          ),
                          onPressed: () {
                            state.botaoCadastrar();
                            state.controllerEmail.clear();
                            state.controllerSenha.clear();
                            state.controllerConfirmaSenha.clear();
                            state.controllerNome.clear();
                          },
                          child: Text(
                            state.login
                                ? 'Não tem uma conta? Cadastre-se!'
                                : 'Já tem uma conta? Entre!',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
