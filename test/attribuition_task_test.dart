// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_am_logged_in_as_user_permission.dart';
import './step/i_select_a_task_named.dart';
import './step/i_choose_members_to_assign_the_task.dart';
import './step/i_tap_button.dart';
import './step/i_see_a_confirmation_message.dart';
import './step/members_receive_notifications_about_the_new_task.dart';
import './step/joao_is_already_overloaded.dart';
import './step/i_see_a_suggestion.dart';
import './step/the_task_assignment_should_not_be_completed.dart';
import './step/i_do_not_select_any_members.dart';
import './step/i_see_an_error_message.dart';

void main() {
  group('''Task Assignment''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmLoggedInAsUserPermission(tester, 'Administrador Geral');
    }

    testWidgets('''Assign a Task to Group Members''', (tester) async {
      await bddSetUp(tester);
      await iSelectATaskNamed(tester, 'Tarefa de Revisão');
      await iChooseMembersToAssignTheTask(tester, 'João' 'Maria');
      await iTapButton(tester, 'Atribuir Tarefa');
      await iSeeAConfirmationMessage(tester, 'Tarefa atribuída com sucesso');
      await membersReceiveNotificationsAboutTheNewTask(tester, 'João' 'Maria');
    });
    testWidgets('''Failure to Assign a Task to Overloaded Members''',
        (tester) async {
      await bddSetUp(tester);
      await joaoIsAlreadyOverloaded(tester);
      await iSelectATaskNamed(tester, 'Tarefa de Revisão');
      await iChooseMembersToAssignTheTask(tester, 'João' 'Ana');
      await iTapButton(tester, 'Atribuir Tarefa');
      await iSeeASuggestion(
          tester, 'João está sobrecarregada. Considere redistribuir tarefas');
      await theTaskAssignmentShouldNotBeCompleted(tester);
    });
    testWidgets(
        '''Failure to Assign a Task When There Aren't Members Selected''',
        (tester) async {
      await bddSetUp(tester);
      await iSelectATaskNamed(tester, 'Tarefa de Revisão');
      await iDoNotSelectAnyMembers(tester);
      await iTapButton(tester, 'Atribuir Tarefa');
      await iSeeAnErrorMessage(
          tester, 'Nenhum membro selecionado para atribuição');
    });
  });
}
