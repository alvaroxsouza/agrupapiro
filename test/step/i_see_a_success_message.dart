import 'package:flutter_test/flutter_test.dart';

/// Usage: I see a success message {'Email de confirmação enviado'}
Future<void> iSeeASuccessMessage(WidgetTester tester, String param1) async {
  // Encontra a mensagem de sucesso no SnackBar
  final successMessage = find.text(param1);

  // Verifica se a mensagem foi encontrada
  expect(successMessage, findsOneWidget, reason: 'Mensagem de sucesso "$param1" não foi encontrada.');

  // Aguarda para garantir que o teste não prossiga prematuramente
  await tester.pumpAndSettle();
}
