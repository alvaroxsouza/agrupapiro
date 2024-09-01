import 'package:flutter_test/flutter_test.dart';

/// Usage: I see an error message {'Prazo anterior a data atual'}
Future<void> iSeeAnErrorMessage(WidgetTester tester, String param1) async {
  // Encontra a mensagem de erro com o texto fornecido
  final errorMessage = find.text(param1);

  // Verifica se a mensagem de erro foi encontrada
  expect(errorMessage, findsOneWidget, reason: 'A mensagem de erro "$param1" não foi encontrada.');

  // Aguarda para garantir que o teste não prossiga prematuramente
  await tester.pumpAndSettle();
}
