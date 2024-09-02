import 'package:flutter_test/flutter_test.dart';

/// Usage: I select a task named {'Tarefa de Revisão'}
Future<void> iSelectATaskNamed(WidgetTester tester, String taskName) async {
  // Encontra o widget de texto que contém o nome da tarefa
  final taskFinder = find.text(taskName);

  // Verifica se o widget foi encontrado
  expect(taskFinder, findsOneWidget, reason: 'A tarefa "$taskName" deveria estar visível na tela');

  // Realiza um toque no widget correspondente à tarefa encontrada
  await tester.tap(taskFinder);

  // Aguarda o ciclo de frames para garantir que a ação foi realizada
  await tester.pumpAndSettle();
}
