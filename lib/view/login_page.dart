import 'package:agrupapiro/enum/rotas.dart';
import 'package:flutter/material.dart';

import '../components/button_custom.dart';
import '../components/input_custom.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  InputCustom(
                    label: 'Email/Usuário',
                    hint: 'Digite seu email/Usuario',
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(height: 16),
                  InputCustom(
                    label: 'Senha',
                    hint: 'Digite sua senha',
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonCustom(
                        label: 'Cadastrar',
                        color: Colors.white,
                        colorText: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.CADASTRO);
                        },
                      ),
                      ButtonCustom(
                        label: 'Entrar',
                        color: Colors.red,
                        colorText: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.HOME);
                        },
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
