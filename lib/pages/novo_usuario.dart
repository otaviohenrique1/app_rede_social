import 'package:app_rede_social/components/botao.dart';
import 'package:app_rede_social/themes/themes_colors.dart';
import 'package:app_rede_social/utils/validator.dart';
import 'package:flutter/material.dart';

import '../components/campo_texto.dart';

class NovoUsuario extends StatefulWidget {
  const NovoUsuario({super.key});

  @override
  State<NovoUsuario> createState() => _NovoUsuarioState();
}

class _NovoUsuarioState extends State<NovoUsuario> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  novoUsuario() {}

  esqueceuSenha() {}

  onSubmit() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1400) {
            return _FormularioLogin(
              width: 1000,
              formKey: formKey,
              nomeController: _nomeController,
              emailController: _emailController,
              senhaController: _senhaController,
              confirmarSenhaController: _confirmarSenhaController,
              onPressedCadastrar: onSubmit,
            );
          } else if (constraints.maxWidth > 1200) {
            return _FormularioLogin(
              width: 800,
              formKey: formKey,
              nomeController: _nomeController,
              emailController: _emailController,
              senhaController: _senhaController,
              confirmarSenhaController: _confirmarSenhaController,
              onPressedCadastrar: onSubmit,
            );
          } else if (constraints.maxWidth > 1000) {
            return _FormularioLogin(
              width: 700,
              formKey: formKey,
              nomeController: _nomeController,
              emailController: _emailController,
              senhaController: _senhaController,
              confirmarSenhaController: _confirmarSenhaController,
              onPressedCadastrar: onSubmit,
            );
          } else if (constraints.maxWidth > 800) {
            return _FormularioLogin(
              width: 600,
              formKey: formKey,
              nomeController: _nomeController,
              emailController: _emailController,
              senhaController: _senhaController,
              confirmarSenhaController: _confirmarSenhaController,
              onPressedCadastrar: onSubmit,
            );
          } else if (constraints.maxWidth > 600) {
            return _FormularioLogin(
              width: 500,
              formKey: formKey,
              nomeController: _nomeController,
              emailController: _emailController,
              senhaController: _senhaController,
              confirmarSenhaController: _confirmarSenhaController,
              onPressedCadastrar: onSubmit,
            );
          } else {
            return _FormularioLogin(
              width: 300,
              formKey: formKey,
              nomeController: _nomeController,
              emailController: _emailController,
              senhaController: _senhaController,
              confirmarSenhaController: _confirmarSenhaController,
              onPressedCadastrar: onSubmit,
            );
          }
        },
      ),
    );
  }
}

class _FormularioLogin extends StatelessWidget {
  const _FormularioLogin({
    // ignore: unused_element
    super.key,
    required this.formKey,
    required this.width,
    required this.emailController,
    required this.senhaController,
    required this.onPressedCadastrar,
    required this.nomeController,
    required this.confirmarSenhaController,
  });

  final double width;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController nomeController;
  final TextEditingController senhaController;
  final TextEditingController confirmarSenhaController;
  final Function() onPressedCadastrar;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  CampoTexto(
                    exibeLabel: true,
                    label: "Nome",
                    validator: validaCampoVazio,
                    keyboardType: TextInputType.text,
                    controller: nomeController,
                    hintText: "Digite o seu nome",
                    obscureText: false,
                  ),
                  CampoTexto(
                    exibeLabel: true,
                    label: "E-mail",
                    validator: validaCampoVazio,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    hintText: "Digite o seu email",
                    obscureText: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CampoTexto(
                      exibeLabel: true,
                      label: "Senha",
                      validator: validaCampoVazio,
                      keyboardType: TextInputType.text,
                      controller: senhaController,
                      hintText: "Digite a sua senha",
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CampoTexto(
                      exibeLabel: true,
                      label: "Repita a senha",
                      validator: validaCampoVazio,
                      keyboardType: TextInputType.text,
                      controller: confirmarSenhaController,
                      hintText: "Confirme a sua senha",
                      obscureText: true,
                    ),
                  ),
                  Botao(
                    onPressed: onPressedCadastrar,
                    label: "Cadastrar",
                    fontColor: ThemesColors.white,
                    backgroundColor: ThemesColors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
