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

    testWidgets('''Successful Account Creation''', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(tester, 'mail@mail.com', 'email');
      await iEnterIntoInputField(tester, 'password', 'senha');
      await iEnterIntoInputField(tester, 'fulano Di tal', 'usuario');
      await iTapButton(tester, 'Criar conta');
      await iSeeASuccessMessage(tester, 'Email de confirmação enviado');
      await aConfirmationEmailShouldBeSentTo(tester, 'mail@mail.com');
    });
    testWidgets('''Invalid Email Format''', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(tester, 'mail_mail.com', 'email');
      await iEnterIntoInputField(tester, 'password', 'senha');
      await iEnterIntoInputField(tester, 'fulano Di tal', 'usuario');
      await iTapButton(tester, 'Criar conta');
      await iSeeAnErrorMessage(tester, 'Email inválido');
    });
  });
}
