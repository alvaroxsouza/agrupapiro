import 'package:flutter_test/flutter_test.dart';

import './step/i_enter_into_input_field.dart';
import './step/i_see_text.dart';
import './step/i_should_be_redirected_to_the_applications_homepage.dart';
import './step/i_tap_button.dart';
import './step/the_app_is_running.dart';
import './step/the_user_is_registered_with_password.dart';

void main() {
  group('User Login', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await theUserIsRegisteredWithPassword(
          tester, 'mail@mail.com', 'password'); // Usuário pré-registrado
    }

    testWidgets('Successful Login', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(
          tester, 'mail@mail.com', 0); // Campo de email (índice 0)
      await iEnterIntoInputField(
          tester, 'password', 1); // Campo de senha (índice 1)
      await iTapButton(tester, 'Entrar'); // Botão de login
      await iShouldBeRedirectedToTheApplicationsHomepage(
          tester); // Verificação de redirecionamento
    });

    testWidgets('Invalid Username', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(
          tester, 'wronguser@mail.com', 0); // Email inválido (índice 0)
      await iEnterIntoInputField(tester, 'password', 1); // Senha (índice 1)
      await iTapButton(tester, 'Entrar');
      await iSeeText(tester,
          'Falha no login. Verifique suas credenciais.'); // Mensagem de erro
    });

    testWidgets('Invalid Password', (tester) async {
      await bddSetUp(tester);
      await iEnterIntoInputField(
          tester, 'mail@mail.com', 0); // Email (índice 0)
      await iEnterIntoInputField(
          tester, 'wrongpassword', 1); // Senha inválida (índice 1)
      await iTapButton(tester, 'Entrar');
      await iSeeText(tester,
          'Falha no login. Verifique suas credenciais.'); // Mensagem de erro
    });
  });
}
