import 'package:app_rede_social/pages/esqueceu_senha.dart';
import 'package:flutter/material.dart';
import 'package:app_rede_social/pages/novo_usuario.dart';
import 'package:app_rede_social/components/campo_texto.dart';
import 'package:app_rede_social/components/botao.dart';
import 'package:app_rede_social/themes/themes_colors.dart';
import 'package:app_rede_social/utils/validator.dart';

import 'homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  novoUsuario(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NovoUsuario()));
  }

  esqueceuSenha() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const EsqueceuSenha()));
  }

  onSubmit() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1000) {
            return _FormularioLogin(
              width: 1000,
              formKey: formKey,
              emailController: _emailController,
              senhaController: _senhaController,
              onPressedEntrar: onSubmit,
              onPressedEsqueceuSenha: esqueceuSenha,
              onPressedNovoUsuario: () => novoUsuario(context),
            );
          } else if (constraints.maxWidth > 800) {
            return _FormularioLogin(
              width: 800,
              formKey: formKey,
              emailController: _emailController,
              senhaController: _senhaController,
              onPressedEntrar: onSubmit,
              onPressedEsqueceuSenha: esqueceuSenha,
              onPressedNovoUsuario: () => novoUsuario(context),
            );
          } else {
            return _FormularioLogin(
              width: 600,
              formKey: formKey,
              emailController: _emailController,
              senhaController: _senhaController,
              onPressedEntrar: onSubmit,
              onPressedEsqueceuSenha: esqueceuSenha,
              onPressedNovoUsuario: () => novoUsuario(context),
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
    required this.onPressedEntrar,
    required this.onPressedEsqueceuSenha,
    required this.onPressedNovoUsuario,
  });

  final double width;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController senhaController;
  final Function() onPressedEntrar;
  final Function() onPressedEsqueceuSenha;
  final Function() onPressedNovoUsuario;

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
                    label: "E-mail",
                    validator: validaCampoVazio,
                    keyboardType: TextInputType.multiline,
                    controller: emailController,
                    hintText: "Digite o titulo da tarefa",
                    obscureText: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CampoTexto(
                      exibeLabel: true,
                      label: "Senha",
                      validator: validaCampoVazio,
                      // keyboardType: TextInputType.text,
                      controller: senhaController,
                      hintText: "Digite o titulo da tarefa",
                      obscureText: true,
                    ),
                  ),
                  Botao(
                    onPressed: onPressedEntrar,
                    label: "Entrar",
                    fontColor: ThemesColors.white,
                    backgroundColor: ThemesColors.blueGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextButton(
                      onPressed: onPressedEsqueceuSenha,
                      child: const Text(
                        "Esqueceu a senha?",
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          color: ThemesColors.blue,
                          decorationColor: ThemesColors.blue,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onPressedNovoUsuario,
                    child: const Text.rich(TextSpan(
                      text: "Ainda não tem conta? ",
                      children: [
                        TextSpan(
                          text: "Faça seu cadastro!",
                          style: TextStyle(color: ThemesColors.blueAccent),
                        ),
                      ],
                      style: TextStyle(
                        fontSize: 18,
                        color: ThemesColors.grey,
                      ),
                    )),
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
