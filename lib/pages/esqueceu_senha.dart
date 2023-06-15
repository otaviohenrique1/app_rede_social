import 'package:flutter/material.dart';
import 'package:app_rede_social/components/campo_texto.dart';
import 'package:app_rede_social/components/botao.dart';
import 'package:app_rede_social/themes/themes_colors.dart';
import 'package:app_rede_social/utils/validator.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  cancelar(BuildContext context) {
    Navigator.pop(context);
  }

  onSubmit() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Esqueceu a senha?"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1000) {
            return _FormularioLogin(
              width: 1000,
              formKey: formKey,
              emailController: _emailController,
              onPressedProximo: onSubmit,
              onPressedCancelar: () => cancelar(context),
            );
          } else if (constraints.maxWidth > 800) {
            return _FormularioLogin(
              width: 800,
              formKey: formKey,
              emailController: _emailController,
              onPressedProximo: onSubmit,
              onPressedCancelar: () => cancelar(context),
            );
          } else {
            return _FormularioLogin(
              width: 600,
              formKey: formKey,
              emailController: _emailController,
              onPressedProximo: onSubmit,
              onPressedCancelar: () => cancelar(context),
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
    required this.onPressedProximo,
    required this.onPressedCancelar,
  });

  final double width;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final Function() onPressedProximo;
  final Function() onPressedCancelar;

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
                      "Esqueceu a senha? Digite o seu e-mail para que enviaremos um codigo para a recuperação da senha.",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: CampoTexto(
                      exibeLabel: true,
                      label: "E-mail",
                      validator: validaCampoVazio,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      hintText: "Digite o seu e-mail",
                      obscureText: false,
                    ),
                  ),
                  Botao(
                    onPressed: onPressedProximo,
                    label: "Proximo",
                    fontColor: ThemesColors.white,
                    backgroundColor: ThemesColors.blueGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Botao(
                      onPressed: onPressedCancelar,
                      label: "Cancelar",
                      fontColor: ThemesColors.white,
                      backgroundColor: ThemesColors.red,
                    ),
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
