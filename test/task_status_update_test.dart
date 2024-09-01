// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_am_logged_in_as_user_permission.dart';
import './step/i_have_tasks_assigned_to_me.dart';
import './step/i_select_a_task_called.dart';
import './step/i_update_the_status_to.dart';
import './step/i_tap_button.dart';
import './step/i_see_the_updated_status.dart';
import './step/the_system_notifies_the_administrator_and_relevant_members.dart';
import './step/i_am_not_authenticated_because_the_session_expired.dart';
import './step/i_attempt_to_update_the_status_of_a_task.dart';
import './step/i_am_prompted_to_log_in_again.dart';
import './step/the_system_encounters_a_connection_error.dart';
import './step/i_see_an_error_message.dart';
import './step/i_attempt_to_update_the_status_to.dart';

void main() {
  group('''Atualizar Status das Tarefas''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmLoggedInAsUserPermission(tester, 'Membro Comum');
      await iHaveTasksAssignedToMe(tester);
    }

    testWidgets('''Successfully Updating the Status of a Task''',
        (tester) async {
      await bddSetUp(tester);
      await iSelectATaskCalled(tester, 'Revisar Documentação');
      await iUpdateTheStatusTo(tester, 'Em Progresso');
      await iTapButton(tester, 'Atualizar Status');
      await iSeeTheUpdatedStatus(tester, 'Em Progresso');
      await theSystemNotifiesTheAdministratorAndRelevantMembers(tester);
    });
    testWidgets('''Failure to Update Status Due to Invalid Credentials''',
        (tester) async {
      await bddSetUp(tester);
      await iAmNotAuthenticatedBecauseTheSessionExpired(tester);
      await iAttemptToUpdateTheStatusOfATask(tester);
      await iAmPromptedToLogInAgain(tester);
    });
    testWidgets('''Failure to Update Status Due to a Connection Error''',
        (tester) async {
      await bddSetUp(tester);
      await theSystemEncountersAConnectionError(tester);
      await iSeeAnErrorMessage(
          tester, 'Erro ao atualizar status. Tente novamente mais tarde');
    });
    testWidgets('''Invalid Status Selection''', (tester) async {
      await bddSetUp(tester);
      await iAttemptToUpdateTheStatusTo(tester, 'Incompleto');
      await iSeeAnErrorMessage(
          tester, 'Status inválido. Selecione um status válido');
    });
  });
}
