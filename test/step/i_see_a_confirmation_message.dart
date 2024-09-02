import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see a confirmation message {'Tarefa removida com sucesso'}
Future<void> iSeeAConfirmationMessage(WidgetTester tester, String message) async {
  // Encontra o SnackBar que contém a mensagem de confirmação
  final snackBarFinder = find.byWidgetPredicate(
    (widget) => widget is SnackBar && (widget.content as Text).data == message,
  );

  // Verifica se o SnackBar com a mensagem foi encontrado
  expect(snackBarFinder, findsOneWidget, reason: 'A mensagem de confirmação "$message" deveria estar visível na tela');

  // Aguarda o ciclo de frames para garantir que tudo foi processado
  await tester.pumpAndSettle();
}
