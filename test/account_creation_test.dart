// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/a_confirmation_email_should_be_sent_to.dart';
import './step/i_am_on_the_page.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_see_a_success_message.dart';
import './step/i_see_an_error_message.dart';
import './step/i_tap_button.dart';
import './step/the_app_is_running.dart';

void main() {
  group('''Account Creation''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmOnThePage(tester, 'Criar conta');
    }

    testWidgets('''Successful Account Creation''', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(tester, 'mail@mail.com', 0); // Index atualizado para campo email
      await iEnterIntoInputField(tester, 'password', 1); // Index atualizado para campo senha
      await iEnterIntoInputField(tester, 'fulano Di tal', 2); // Index atualizado para campo nome/usuário
      await iTapButton(tester, 'Cadastrar'); // Texto do botão atualizado para 'Cadastrar'
      await iSeeASuccessMessage(tester, 'Usuário cadastrado com sucesso!'); // Texto de sucesso atualizado
      await aConfirmationEmailShouldBeSentTo(tester, 'mail@mail.com');
    });

    testWidgets('''Invalid Email Format''', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(tester, 'mail_mail.com', 0); // Index atualizado para campo email
      await iEnterIntoInputField(tester, 'password', 1); // Index atualizado para campo senha
      await iEnterIntoInputField(tester, 'fulano Di tal', 2); // Index atualizado para campo nome/usuário
      await iTapButton(tester, 'Cadastrar'); // Texto do botão atualizado para 'Cadastrar'
      await iSeeAnErrorMessage(tester, 'Email inválido');
    });
  });
}
