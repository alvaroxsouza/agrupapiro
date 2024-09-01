import 'package:flutter_test/flutter_test.dart';

import './step/i_am_logged_in_as.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_see_a_success_message.dart';
import './step/i_see_an_error_message.dart';
import './step/i_tap_button.dart';
import './step/the_app_is_running.dart';
import './step/the_group_should_be_visible_in_my_groups.dart';

void main() {
  group('Group Creation', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iAmLoggedInAs(tester, 'Administrador Geral');
    }

    testWidgets('Successfully Creating a New Group', (tester) async {
      await bddSetUp(tester);

      // Preenche o campo "Nome do Grupo"
      await iEnterIntoInputField(tester, 'EngenhariaSoftwareII', 0);

      // Preenche o campo "Sigla"
      await iEnterIntoInputField(tester, 'ESII', 1);

      // Preenche o campo "Descrição do Grupo"
      await iEnterIntoInputField(tester, 'Grupo de organização de tarefas EngenhariaSoftwareII', 2);

      // Preenche o campo "Instituição"
      await iEnterIntoInputField(tester, 'Universidade XYZ', 3);

      // Preenche o campo "Departamento"
      await iEnterIntoInputField(tester, 'Departamento de Engenharia', 4);

      // Toca no botão "Criar Grupo"
      await iTapButton(tester, 'Criar Grupo');

      // Verifica se a mensagem de sucesso é exibida
      await iSeeASuccessMessage(tester, 'Grupo de Pesquisa cadastrado com sucesso!');

      // Verifica se o grupo criado é visível na lista de grupos
      await theGroupShouldBeVisibleInMyGroups(tester, 'EngenhariaSoftwareII');
    });

    testWidgets('Creating a Group with an Existing Name', (tester) async {
      await bddSetUp(tester);

      // Preenche o campo "Nome do Grupo" com um nome já existente
      await iEnterIntoInputField(tester, 'EngenhariaSoftwareII', 0);

      // Preenche o campo "Sigla"
      await iEnterIntoInputField(tester, 'ESII', 1);

      // Preenche o campo "Descrição do Grupo"
      await iEnterIntoInputField(tester, 'Tarefas ES2', 2);

      // Preenche o campo "Instituição"
      await iEnterIntoInputField(tester, 'Universidade XYZ', 3);

      // Preenche o campo "Departamento"
      await iEnterIntoInputField(tester, 'Departamento de Engenharia', 4);

      // Toca no botão "Criar Grupo"
      await iTapButton(tester, 'Criar Grupo');

      // Verifica se a mensagem de erro é exibida
      await iSeeAnErrorMessage(tester, 'Um grupo com esse mesmo nome já existe');
    });
  });
}
