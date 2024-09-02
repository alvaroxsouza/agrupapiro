// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_am_logged_in_as_user_permission.dart';
import './step/i_see_a_confirmation_message.dart';
import './step/i_see_an_error_message.dart';
import './step/i_select_a_task_named.dart';
import './step/i_tap_button.dart';
import './step/the_app_is_running.dart';
import './step/the_system_encounters_an_error.dart';
import './step/the_task_no_longer_appears_in_the_task_lists_of_the_members.dart';
import './step/there_are_tasks_created_in_the_system.dart';

void main() {
  group('Remove Task', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmLoggedInAsUserPermission(tester, 'Administrador Geral');
      await thereAreTasksCreatedInTheSystem(tester, idGrupo: '1');
    }

    testWidgets('Successfully Removing an Existing Task', (tester) async {
      await bddSetUp(tester);
      await iSelectATaskNamed(tester, 'Tarefa Obsoleta');
      await iTapButton(tester, 'Remover Tarefa');
      await iSeeAConfirmationMessage(tester, 'Tarefa removida com sucesso');
      await theTaskNoLongerAppearsInTheTaskListsOfTheMembers(tester);
    });

    testWidgets('Failure to Remove a Task Due to System Error', (tester) async {
      await bddSetUp(tester);
      await theSystemEncountersAnError(tester);
      await iSeeAnErrorMessage(
          tester, 'Erro ao remover a tarefa. Tente novamente mais tarde');
    });
  });
}
