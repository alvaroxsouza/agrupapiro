import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: the task no longer appears in the task lists of the members
Future<void> theTaskNoLongerAppearsInTheTaskListsOfTheMembers(
    WidgetTester tester) async {
  
  // Aguarda o ciclo de frames para garantir que a interface foi atualizada
  await tester.pumpAndSettle();

  // Encontra qualquer ListTile que possa estar presente na lista de tarefas
  final taskFinder = find.byType(ListTile);

  // Verifica se não há nenhum ListTile restante, significando que nenhuma tarefa está sendo exibida
  expect(taskFinder, findsNothing, reason: 'A tarefa não deveria mais aparecer na lista de tarefas dos membros.');
}
