import 'package:app_rede_social/components/botao.dart';
import 'package:app_rede_social/utils/validator.dart';
import 'package:flutter/material.dart';

import '../components/campo_texto.dart';

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

  novoUsuario() {}

  esqueceuSenha() {}

  onSubmit() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Formulario(
              formKey: formKey,
              emailController: _emailController,
              senhaController: _senhaController,
              onPressedEntrar: onSubmit,
              onPressedEsqueceuSenha: esqueceuSenha,
              onPressedNovoUsuario: novoUsuario,
            ),
          ),
        ],
      ),
    );
  }
}

class Formulario extends StatelessWidget {
  const Formulario({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.senhaController,
    required this.onPressedEntrar,
    required this.onPressedEsqueceuSenha,
    required this.onPressedNovoUsuario,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController senhaController;
  final Function() onPressedEntrar;
  final Function() onPressedEsqueceuSenha;
  final Function() onPressedNovoUsuario;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
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
              fontColor: Colors.white,
              label: "Entrar",
              backgroundColor: Colors.blueGrey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextButton(
                onPressed: onPressedEsqueceuSenha,
                child: const Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ainda não tem conta?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: onPressedNovoUsuario,
                  child: const Text(
                    "Faça seu cadastro!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
