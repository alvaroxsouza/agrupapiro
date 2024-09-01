import 'package:agrupapiro/components/button_custom.dart';
import 'package:agrupapiro/components/input_custom.dart';
import 'package:agrupapiro/controllers/usuario_sistema_controller.dart';
import 'package:agrupapiro/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final universidadeController = TextEditingController();
  final cursoController = TextEditingController();
  final periodoController = TextEditingController();
  final telefoneController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    universidadeController.dispose();
    cursoController.dispose();
    periodoController.dispose();
    telefoneController.dispose();
    super.dispose();
  }

  Future<void> _cadastrarUsuario() async {
    if (_formKey.currentState?.validate() ?? false) {
      final usuario = UsuarioSistema(
        cpf: cpfController.text,
        email: emailController.text,
        nome: nomeController.text,
        senha: senhaController.text,
        universidade: universidadeController.text,
        curso: cursoController.text,
        periodo: periodoController.text,
        telefone: telefoneController.text,
      );

      try {
        final result = await ref
            .read(usuarioSistemaControllerProvider.notifier)
            .addUsuario(usuario);

        if (!mounted) return;

        if (result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuário cadastrado com sucesso!'),
            ),
          );
          // Navegue para outra página ou limpe o formulário
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Falha ao cadastrar o usuário'),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro: $e'),
          ),
        );
      }
      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(usuarioSistemaControllerProvider);

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
                onChanged: (value) {},
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
                onChanged: (value) {},
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
                onChanged: (value) {},
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
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              InputCustom(
                label: 'Universidade',
                hint: 'Digite sua universidade - Ex.: UFBA',
                password: false,
                controller: universidadeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Universidade não pode estar vazia';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Atualização do valor da senha
                },
              ),
              const SizedBox(height: 16),
              InputCustom(
                label: 'Curso',
                hint: 'Digite seu curso - Ex.: Ciência da Computação',
                password: false,
                controller: cursoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Curso não pode estar vazio';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Atualização do valor da senha
                },
              ),
              const SizedBox(height: 16),
              InputCustom(
                label: 'Período',
                hint: 'Digite seu período - Ex.: 1',
                password: false,
                controller: periodoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Período não pode estar vazio';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Atualização do valor da senha
                },
              ),
              const SizedBox(height: 16),
              InputCustom(
                label: 'Telefone',
                hint: 'Digite seu telefone - Ex.: 71999999999',
                password: false,
                controller: telefoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Telefone não pode estar vazio';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Atualização do valor da senha
                },
              ),
              const SizedBox(height: 16),
              ButtonCustom(
                label: 'Cadastrar',
                color: Colors.red,
                colorText: Colors.white,
                onPressed: _cadastrarUsuario,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
