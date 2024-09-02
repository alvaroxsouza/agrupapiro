import 'package:agrupapiro/controllers/usuario_sistema_controller.dart';
import 'package:agrupapiro/services/auth_service.dart';
import 'package:agrupapiro/services/sessao_service.dart';
import 'package:agrupapiro/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/constants/enum/rotas.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    ref.watch(authServiceProvider);

    Future<void> entrar() async {
      {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        if (email.isEmpty || password.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Por favor, preencha todos os campos.')),
          );
          return;
        }

        final tokenSession =
            await ref.read(authServiceProvider).login(email, password);

        if (tokenSession != '') {
          ref.read(sessaoServiceProvider).saveUserSession(tokenSession);
          final usuario = await ref
              .read(usuarioSistemaControllerProvider.notifier)
              .fetchUsuarioById(tokenSession);

          if (context.mounted && usuario != null) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(usuario: usuario)),
            );
          }
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Falha no login. Verifique suas credenciais.')),
            );
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email/Usuário',
                      hintText: 'Digite seu email/usuário',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Digite sua senha',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.CADASTRO);
                        },
                        child: const Text('Cadastrar'),
                      ),
                      ElevatedButton(
                        onPressed: entrar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(100, 50),
                        ),
                        child: const Text('Entrar'),
                      ),
                    ],
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
