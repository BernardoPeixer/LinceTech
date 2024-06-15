// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class DadosDoPerfil extends StatelessWidget {
  const DadosDoPerfil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(44, 41, 41, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(14, 12, 12, 1),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'DADOS DO PERFIL',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'APELIDO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text(
                      'apelido',
                      style: TextStyle(fontSize: 14),
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    fillColor: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'NOME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text(
                      'nome completo',
                      style: TextStyle(fontSize: 14),
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    fillColor: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'E-MAIL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text(
                      'e-mail',
                      style: TextStyle(fontSize: 14),
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    fillColor: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                ),
                onPressed: () {},
                child: Text(
                  'ATUALIZAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0),
                  side: BorderSide(width: 0.7, color: Colors.white),
                ),
                onPressed: () {},
                child: Text(
                  'TROCAR SENHA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.white,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'ENCERRAR CONTA',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
