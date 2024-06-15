import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jogos/controller/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/alertsDialogs.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginState with ChangeNotifier {
  LoginState() {
    load();
    init();
  }

  bool login = true;
  final keyForm = GlobalKey<FormState>();
  List<Usuario> listaUsuario = [];

  final String urlImage =
      'https://gomg.org.br/wp-content/uploads/2022/11/user.png';

  final controller = UsuarioController();
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  final _controllerConfirmaSenha = TextEditingController();
  final _controllerNome = TextEditingController();

  TextEditingController get controllerEmail => _controllerEmail;
  TextEditingController get controllerSenha => _controllerSenha;
  TextEditingController get controllerConfirmaSenha => _controllerConfirmaSenha;
  TextEditingController get controllerNome => _controllerNome;

  Future<void> insert() async {
    final usuario = Usuario(
      nome: controllerNome.text,
      email: controllerEmail.text,
      senha: controllerSenha.text,
    );

    await controller.insert(usuario);
    await load();

    controllerEmail.clear();
    controllerNome.clear();
    controllerSenha.clear();
    controllerConfirmaSenha.clear();
    notifyListeners();
    print('insert concluido');
  }

  Widget buildHeader({
    required File? profileImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: profileImage != null
                    ? FileImage(profileImage)
                    : NetworkImage(urlImage) as ImageProvider,
              ),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final colorIcon = Colors.yellow;
    final colorText = Colors.white;
    final houverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: colorIcon),
      title: Text(
        text,
        style: TextStyle(
          color: colorText,
        ),
      ),
      hoverColor: houverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(context, index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/FotoDePerfil');
        break;
      case 1:
        Navigator.pushNamed(context, '/DadosDoPerfil');
        break;
      case 2:
        Navigator.pushNamed(context, '/Desempenho');
        break;
    }
  }

  Future<void> load() async {
    final lista = await controller.select();

    listaUsuario.clear();
    listaUsuario.addAll(lista);

    notifyListeners();
  }

  File? profileImage;

  Future<void> getImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    ImageCropper cropper = ImageCropper();
    XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      CroppedFile? croppedFile = await cropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 100,
        maxWidth: 100,
        compressFormat: ImageCompressFormat.jpg,
      );
      if (croppedFile != null) {
        profileImage = File(croppedFile.path);
      }
    }
  }

  late final SharedPreferences sharedPreferences;
  var nomeKey = 'keyName';
  var emailKey = 'keyEmail';
  var boolKey = 'keyBool';
  String nomeLogado = '';
  String emailLogado = '';
  bool logado = false;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    nomeLogado = sharedPreferences.getString(nomeKey) ?? 'Usuario';
    emailLogado =
        sharedPreferences.getString(emailKey) ?? 'example@example.com';
    logado = sharedPreferences.getBool(boolKey) ?? false;
    notifyListeners();
  }

  Future<void> validarLoginCadastro(context) async {
    if (login) {
      usuarioLogado = await retornarUsuario();
      await sharedPreferences.setString(
          nomeKey, usuarioLogado?.nome ?? 'Usuario');
      nomeLogado = usuarioLogado?.nome ?? 'Usuario';
      await sharedPreferences.setString(
          emailKey, usuarioLogado?.email ?? 'example@example.com');
      emailLogado = usuarioLogado?.email ?? 'Usuario';
      await sharedPreferences.setBool(boolKey, true);
      logado = true;
      validarSenhaEmail(context);
      print(nomeLogado);
    } else {
      bool emailJaRegistrado = await compararUsuariosEmail(context);
      if (!emailJaRegistrado && keyForm.currentState!.validate()) {
        await insert();
        login = !login;
      }
    }
    notifyListeners();
  }

  Future<void> excluir() async {
    await sharedPreferences.setBool(boolKey, false);
    await sharedPreferences.setString(nomeKey, 'Usuario');
    await sharedPreferences.setString(emailKey, 'example@example.com');
    nomeLogado = 'Usuario';
    emailLogado = 'example@example.com';
    logado = false;
    profileImage = null; // Imagem temporária!!!
    print(logado);
    notifyListeners();
  }

  Usuario? usuarioLogado = null;

  Future<Usuario?> retornarUsuario() async {
    listaUsuario = await controller.select();
    for (int i = 0; i < listaUsuario.length; i++) {
      if (listaUsuario[i].email == controllerEmail.text &&
          listaUsuario[i].senha == controllerSenha.text) {
        usuarioLogado = Usuario(
            nome: listaUsuario[i].nome,
            email: listaUsuario[i].email,
            senha: listaUsuario[i].senha);
        break;
      }
    }
    return usuarioLogado;
  }

  Future<Widget?> validarSenhaEmail(context) async {
    listaUsuario = await controller.select();
    for (int i = 0; i < listaUsuario.length; i++) {
      if (listaUsuario[i].email == controllerEmail.text &&
          listaUsuario[i].senha == controllerSenha.text) {
        Navigator.pop(context);
        logado = true;
        return null;
      }
    }
    return showAlertDialogLogar(context);
  }

  Future<bool> compararUsuariosEmail(BuildContext context) async {
    listaUsuario = await controller.select();
    for (int i = 0; i < listaUsuario.length; i++) {
      if (listaUsuario[i].email.contains(controllerEmail.text)) {
        await showAlertDialogCadastrar(context);
        return true; // Email já está registrado
      }
    }
    return false; // Email não está registrado
  }

  Future<String?> compararUsuariosNome() async {
    listaUsuario = await controller.select();
    for (int i = 0; i < listaUsuario.length; i++) {
      if (listaUsuario[i].nome == controllerNome.text) {
        return 'Nome já cadastrado!';
      }
    }
    return null;
  }

  String? validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório!';
    }
    if (!value.contains('@')) {
      return 'Email inválido!';
    }
    return null;
  }

  String? validatorSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório!';
    }
    if (value.length < 5) {
      return 'Sua senha precisa ser maior!';
    }
    return null;
  }

  String? validatorConfirmaSenha(String? value) {
    if (value != controllerSenha.text) {
      return 'As senhas devem ser iguais!';
    }
    return null;
  }

  String? validatorNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    if (value.length > 10) {
      return 'Nome muito grande!';
    }
    return null;
  }

  void botaoCadastrar() {
    login = !login;
    notifyListeners();
  }
}

class Usuario {
  Usuario(
      {required this.nome, required this.email, required this.senha, this.id});
  late int? id;
  final String nome;
  final String email;
  final String senha;
}
