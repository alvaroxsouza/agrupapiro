import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: the system encounters an error
Future<void> theSystemEncountersAnError(WidgetTester tester) async {
  // Simula um erro no sistema ao tentar deletar uma tarefa o sistema encontra um erro.
  
  // Encontra o ícone de delete da tarefa na interface.
  final deleteIconFinder = find.byIcon(Icons.delete).first;

  // Simula um toque no botão de delete.
  await tester.tap(deleteIconFinder);

  // Aguarda o ciclo de frames para garantir que as mudanças sejam aplicadas.
  await tester.pumpAndSettle();

  // Verifica se uma mensagem de erro foi exibida, como um SnackBar ou um alerta.
  final errorFinder = find.textContaining('Erro');
  
  // Garante que uma mensagem de erro está presente na tela.
  expect(errorFinder, findsOneWidget, reason: 'O sistema deveria exibir uma mensagem de erro.');
}
