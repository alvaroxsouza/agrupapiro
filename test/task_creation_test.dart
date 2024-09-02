import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_am_logged_in_as_user_permission.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_see_an_error_message.dart';
import './step/i_should_see_a_confirmation_message.dart';
import './step/i_tap_icon.dart';
import './step/i_tap_text.dart';
import './step/i_tap_text_as_the_priority.dart';
import './step/the_app_is_running.dart';
import './step/the_task_should_be_visible_in_the_groups_task_list.dart';

void main() {
  group('''Task Creation''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmLoggedInAsUserPermission(tester, 'Administrador Geral');
    }

    testWidgets('''Creating a Task''', (tester) async {
      await bddSetUp(tester);

      // Simula o toque no ícone de adicionar tarefa
      await iTapIcon(tester, Icons.add);

      // Preenche o título da tarefa
      await iEnterIntoInputField(tester, 'Levantar requisitos', 0);

      // Preenche a descrição da tarefa
      await iEnterIntoInputField(tester, 'Analisar aplicação e levantar os requisitos', 1);

      // Preenche o prazo da tarefa
      await iEnterIntoInputField(tester, '20/09/2024', 2);

      // Define a prioridade como "média"
      await iTapTextAsThePriority(tester, 'média');

      // Simula o toque no botão "Criar Tarefa"
      await iTapText(tester, 'Salvar Tarefa');

      // Verifica se a mensagem de confirmação aparece
      await iShouldSeeAConfirmationMessage(tester, 'Tarefa criada com sucesso');

      // Verifica se a tarefa aparece na lista de tarefas do grupo
      await theTaskShouldBeVisibleInTheGroupsTaskList(tester, 'Levantar requisitos');
    });

    testWidgets('''Invalid Task Creation Due to Past Deadline''', (tester) async {
      await bddSetUp(tester);

      // Simula o toque no ícone de adicionar tarefa
      await iTapIcon(tester, Icons.add);

      // Preenche o título da tarefa
      await iEnterIntoInputField(tester, 'Levantar requisitos', 0);

      // Preenche a descrição da tarefa
      await iEnterIntoInputField(tester, 'Analisar aplicação e levantar os requisitos', 1);

      // Preenche o prazo da tarefa com uma data no passado
      await iEnterIntoInputField(tester, '20/09/1990', 2);

      // Define a prioridade como "média"
      await iTapTextAsThePriority(tester, 'média');

      // Simula o toque no botão "Criar Tarefa"
      await iTapText(tester, 'Salvar Tarefa');

      // Verifica se a mensagem de erro é exibida
      await iSeeAnErrorMessage(tester, 'Prazo anterior a data atual');
    });
  });
}