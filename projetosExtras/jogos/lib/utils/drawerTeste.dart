import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/loginState.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(builder: (context, state, _) {
      return Drawer(
        child: Material(
          color: Colors.black87,
          child: ListView(
            children: <Widget>[
              state.buildHeader(
                profileImage: state.profileImage,
                name: state.nomeLogado,
                email: state.emailLogado,
                onClicked: () {},
              ),
              SizedBox(
                height: 48,
              ),
              state.buildMenuItem(
                text: 'FOTO DO PERFIL',
                icon: Icons.camera_alt_outlined,
                onClicked: () {
                  state.selectedItem(context, 0);
                },
              ),
              SizedBox(
                height: 16,
              ),
              state.buildMenuItem(
                text: 'DADOS DO PERFIL',
                icon: Icons.edit_outlined,
                onClicked: () {
                  state.selectedItem(context, 1);
                },
              ),
              SizedBox(
                height: 16,
              ),
              state.buildMenuItem(
                text: 'DESEMPENHO',
                icon: Icons.auto_graph_outlined,
                onClicked: () {
                  state.selectedItem(context, 2);
                },
              ),
              SizedBox(
                height: 16,
              ),
              state.buildMenuItem(
                text: 'DESCONECTAR',
                icon: Icons.logout,
                onClicked: () async {
                  await state.excluir();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
