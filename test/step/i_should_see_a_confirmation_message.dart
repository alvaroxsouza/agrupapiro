import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see a confirmation message {'Tarefa criada com sucesso'}
Future<void> iShouldSeeAConfirmationMessage(
    WidgetTester tester, String expectedMessage) async {
  // Localiza o texto da mensagem de confirmação na interface do usuário
  final confirmationMessageFinder = find.text(expectedMessage);

  // Verifica se o texto foi encontrado exatamente uma vez
  expect(confirmationMessageFinder, findsOneWidget);
}
