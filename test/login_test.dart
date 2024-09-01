// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/the_user_is_registered_with_password.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_tap_button.dart';
import './step/i_see_text.dart';
import './step/i_should_be_redirected_to_the_applications_homepage.dart';
import './step/i_tap_text.dart';
import './step/i_see_input_field.dart';

void main() {
  group('''User Login''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await theUserIsRegisteredWithPassword(
          tester, 'Fulano Di Tal', 'password');
    }

    testWidgets('''Successful Login''', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(tester, 'Fulano Di Tal', 'usuario');
      await iEnterIntoInputField(tester, 'password', 'senha');
      await iTapButton(tester, 'Login');
      await iSeeText(tester, 'Bem vindo!');
      await iShouldBeRedirectedToTheApplicationsHomepage(tester);
    });
    testWidgets('''Invalid Username''', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(tester, 'Beltrano', 'usuario');
      await iEnterIntoInputField(tester, 'password', 'senha');
      await iTapButton(tester, 'Login');
      await iSeeText(tester, 'Usuario ou senha inválido');
    });
    testWidgets('''Invalid Password''', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(tester, 'Fulano Di Tal', 'usuario');
      await iEnterIntoInputField(tester, 'pass', 'senha');
      await iTapButton(tester, 'Login');
      await iSeeText(tester, 'Usuario ou senha inválido');
    });
    testWidgets('''Forgot Password''', (tester) async {
      await bddSetUp(tester);
      await iTapText(tester, 'Esqueci minha senha');
      await iSeeInputField(tester, 'email');
      await iEnterIntoInputField(tester, 'mail@mail.com', 'email');
      await iTapButton(tester, 'Recuperar senha');
      await iSeeText(tester, 'Email para troca de senha foi enviado');
    });
  });
}
