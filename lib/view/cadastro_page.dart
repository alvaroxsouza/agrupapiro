import 'package:agrupapiro/components/button_custom.dart';
import 'package:agrupapiro/components/input_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/providers/user_notifier_provider.dart';

class CadastroPage extends ConsumerStatefulWidget {
  const CadastroPage({super.key});

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends ConsumerState<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userNotifier = ref.watch(userProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputCustom(
                label: 'Nome',
                hint: 'Digite seu nome',
                controller: nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome não pode estar vazio';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Atualização do valor do nome, se necessário
                },
              ),
              const SizedBox(height: 16),
              InputCustom(
                label: 'CPF',
                hint: 'Digite seu CPF',
                controller: cpfController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'CPF não pode estar vazio';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Atualização do valor do CPF
                },
              ),
              const SizedBox(height: 16),
              InputCustom(
                label: 'Email',
                hint: 'Digite seu email',
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email não pode estar vazio';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Atualização do valor do email
                },
              ),
              const SizedBox(height: 16),
              InputCustom(
                label: 'Senha',
                hint: 'Digite sua senha',
                password: true,
                controller: senhaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Senha não pode estar vazia';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Atualização do valor da senha
                },
              ),
              const SizedBox(height: 16),
              InputCustom(
                label: 'Digite novamente sua senha',
                hint: 'Digite novamente a sua senha',
                password: true,
                controller: confirmarSenhaController,
                validator: (value) {
                  if (value != senhaController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Atualização do valor da confirmação da senha
                },
              ),
              const SizedBox(height: 16),
              ButtonCustom(
                label: 'Cadastrar',
                color: Colors.red,
                colorText: Colors.white,
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Criando a conta
                    final success = await userNotifier.createAccount(
                      emailController.text,
                      senhaController.text,
                    );

                    if (success) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Falha ao criar conta')),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

