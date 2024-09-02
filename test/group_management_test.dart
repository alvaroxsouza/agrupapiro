// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_am_logged_in_as.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_tap_button.dart';
import './step/i_see_a_success_message.dart';
import './step/the_group_should_be_visible_in_my_groups.dart';
import './step/i_tap_the_button.dart';
import './step/i_see_an_error_message.dart';

void main() {
  group('''Group Creation''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmLoggedInAs(tester, 'Administrador Geral');
    }

    testWidgets('''Successfully Creating a New Group''', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(
          tester, 'EngenhariaSoftwareII', 'nome do grupo');
      await iEnterIntoInputField(tester,
          'Grupo de organização de tarefas EngenhariaSoftwareII', 'descrição');
      await iTapButton(tester, 'Criar grupo');
      await iSeeASuccessMessage(tester, 'Grupo criado com sucesso');
      await theGroupShouldBeVisibleInMyGroups(tester, 'EngenhariaSoftwareII');
    });
    testWidgets('''Creating a Group with an Existing Name''', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(
          tester, 'EngenhariaSoftwareII', 'nome do grupo');
      await iEnterIntoInputField(tester, 'Tarefas ES2', 'descrição');
      await iTapTheButton(tester, 'Criar grupo');
      await iSeeAnErrorMessage(
          tester, 'Um grupo com esse mesmo nome já existe');
    });
  });
}
