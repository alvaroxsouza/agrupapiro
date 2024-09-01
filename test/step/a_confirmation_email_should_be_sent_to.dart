import 'package:flutter_test/flutter_test.dart';

/// Usage: a confirmation email should be sent to {'mail@mail.com'}
Future<void> aConfirmationEmailShouldBeSentTo(
    WidgetTester tester, String param1) async {
  // Verifica se a mensagem de sucesso contendo o e-mail foi exibida
  final successMessage = find.text('Usuário cadastrado com sucesso!');

  // Verifica se a mensagem foi encontrada
  expect(successMessage, findsOneWidget, reason: 'A mensagem de confirmação não foi encontrada.');

  // Verifica se a mensagem contém o e-mail especificado
  final emailContained = find.textContaining(param1);
  expect(emailContained, findsOneWidget, reason: 'O email "$param1" não foi encontrado na mensagem de confirmação.');
  
  // Aguarda para garantir que o teste não prossiga prematuramente
  await tester.pumpAndSettle();
}
