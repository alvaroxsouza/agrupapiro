import 'package:flutter_test/flutter_test.dart';

/// Usage: the task {'Levantar requisitos'} should be visible in the group's task list
Future<void> theTaskShouldBeVisibleInTheGroupsTaskList(
    WidgetTester tester, String expectedTaskTitle) async {
  // Procura o texto da tarefa na lista de tarefas do grupo
  final taskFinder = find.text(expectedTaskTitle);

  // Verifica se a tarefa foi encontrada na lista
  expect(taskFinder, findsOneWidget);
}
