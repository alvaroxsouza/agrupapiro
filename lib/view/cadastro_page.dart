import 'package:flutter/material.dart';
import '../components/button_custom.dart';
import '../components/input_custom.dart';

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputCustom(
              label: 'Nome',
              hint: 'Digite seu nome',
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 16),
            InputCustom(
              label: 'Email',
              hint: 'Digite seu email',
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 16),
            InputCustom(
              label: 'Senha',
              hint: 'Digite sua senha',
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 16),
            ButtonCustom(
              label: 'Cadastrar',
              color: Colors.red,
              colorText: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
