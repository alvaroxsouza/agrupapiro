// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_am_logged_in_as_user_permission.dart';
import './step/i_tap_icon.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_tap_text_as_the_priority.dart';
import './step/i_tap_text.dart';
import './step/i_should_see_a_confirmation_message.dart';
import './step/the_task_should_be_visible_in_the_groups_task_list.dart';
import './step/i_see_an_error_message.dart';

void main() {
  group('''Task Creation''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmLoggedInAsUserPermission(tester, 'Administrador Geral');
    }

    testWidgets('''Creating a Task''', (tester) async {
      await bddSetUp(tester);
      await iTapIcon(tester, Icons.add);
      await iEnterIntoInputField(tester, 'Levantar requisitos', 'titulo');
      await iEnterIntoInputField(
          tester, 'Analisar aplicação e levar os requisitos', 'descrição');
      await iEnterIntoInputField(tester, '20/09/2024', 'prazo');
      await iTapTextAsThePriority(tester, 'média');
      await iTapText(tester, 'Criar Tarefa');
      await iShouldSeeAConfirmationMessage(tester, 'Tarefa criada com sucesso');
      await theTaskShouldBeVisibleInTheGroupsTaskList(
          tester, 'Levantar requisitos');
    });
    testWidgets('''Invalid Task Creation Due to Past Deadline''',
        (tester) async {
      await bddSetUp(tester);
      await iTapIcon(tester, Icons.add);
      await iEnterIntoInputField(tester, 'Levantar requisitos', 'titulo');
      await iEnterIntoInputField(
          tester, 'Analisar aplicação e levar os requisitos', 'descrição');
      await iEnterIntoInputField(tester, '20/09/1990', 'prazo');
      await iTapTextAsThePriority(tester, 'média');
      await iTapText(tester, 'Criar Tarefa');
      await iSeeAnErrorMessage(tester, 'Prazo anterior a data atual');
    });
  });
}
