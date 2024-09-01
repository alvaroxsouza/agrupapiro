// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_am_on_the_page.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_tap_button.dart';
import './step/i_see_a_success_message.dart';
import './step/a_confirmation_email_should_be_sent_to.dart';
import './step/i_see_an_error_message.dart';

void main() {
  group('''Account Creation''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmOnThePage(tester, 'Criar conta');
    }

    testWidgets('Successful Account Creation', (tester) async {
      await bddSetUp(tester);

      // Preencher todos os campos do formulário
      await iEnterIntoInputField(tester, 'fulano Di tal', 0); // Nome
      await iEnterIntoInputField(tester, '12345678909', 1); // CPF
      await iEnterIntoInputField(tester, 'mail@mail.com', 2); // Email
      await iEnterIntoInputField(tester, 'password', 3); // Senha
      await iEnterIntoInputField(tester, 'password', 4); // Confirmar Senha
      await iEnterIntoInputField(tester, 'UFBA', 5); // Universidade
      await iEnterIntoInputField(tester, 'Ciência da Computação', 6); // Curso
      await iEnterIntoInputField(tester, '1', 7); // Período
      await iEnterIntoInputField(tester, '71999999999', 8); // Telefone

      // Clicar no botão 'Cadastrar'
      await iTapButton(tester, 'Cadastrar');

      // Verificar se a mensagem de sucesso aparece
      await iSeeASuccessMessage(tester, 'Usuário cadastrado com sucesso!');

      //TODO: Implementar banco em memória

      // Verificar se um email de confirmação foi enviado
      await aConfirmationEmailShouldBeSentTo(tester, 'mail@mail.com');
    });

    testWidgets('''Invalid Email Format''', (tester) async {
      await bddSetUp(tester);

      // Preencher todos os campos do formulário
      await iEnterIntoInputField(tester, 'fulano Di tal', 0); // Nome
      await iEnterIntoInputField(tester, '12345678909', 1); // CPF
      await iEnterIntoInputField(tester, 'mail_mail.com', 2); // Email
      await iEnterIntoInputField(tester, 'password', 3); // Senha
      await iEnterIntoInputField(tester, 'password', 4); // Confirmar Senha
      await iEnterIntoInputField(tester, 'UFBA', 5); // Universidade
      await iEnterIntoInputField(tester, 'Ciência da Computação', 6); // Curso
      await iEnterIntoInputField(tester, '1', 7); // Período
      await iEnterIntoInputField(tester, '71999999999', 8); // Telefone

      // Clicar no botão '
      await iTapButton(
          tester, 'Cadastrar'); // Texto do botão atualizado para 'Cadastrar'

      await iSeeAnErrorMessage(tester, 'Email inválido');
    });
  });
}
