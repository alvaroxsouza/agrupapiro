// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_am_logged_in_as_user_permission.dart';
import './step/there_are_tasks_with_members_assigned.dart';
import './step/i_select_a_task_named.dart';
import './step/i_remove_the_assignment_of_member.dart';
import './step/i_see_text.dart';
import './step/the_task_no_longer_shows_carlos_as_assigned.dart';
import './step/i_remove_the_assignments_of_members.dart';
import './step/the_task_shows_status.dart';
import './step/the_system_encounters_an_error.dart';
import './step/i_see_an_error_message.dart';

void main() {
  group('''Task Assignment Removal''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmLoggedInAsUserPermission(tester, 'Administrador Geral');
      await thereAreTasksWithMembersAssigned(tester);
    }

    testWidgets('''Remove Assignment of a Specific Member''', (tester) async {
      await bddSetUp(tester);
      await iSelectATaskNamed(tester, 'Tarefa de Revisão');
      await iRemoveTheAssignmentOfMember(tester, 'Carlos');
      await iSeeText(tester, 'Atribuição de Carlos removida com sucesso');
      await theTaskNoLongerShowsCarlosAsAssigned(tester);
    });
    testWidgets('''Remove Assignment of Multiple Members''', (tester) async {
      await bddSetUp(tester);
      await iSelectATaskNamed(tester, 'Tarefa de Revisão');
      await iRemoveTheAssignmentsOfMembers(tester, 'Carlos' 'Ana');
      await iSeeText(tester, 'Todos os membros foram removidos da tarefa');
      await theTaskShowsStatus(tester, 'Não Atribuída');
    });
    testWidgets('''Failure to Remove the Assignment of a Member''',
        (tester) async {
      await bddSetUp(tester);
      await theSystemEncountersAnError(tester);
      await iSeeAnErrorMessage(
          tester, 'Erro ao remover atribuição. Tente novamente mais tarde');
    });
  });
}
