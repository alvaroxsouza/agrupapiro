import 'package:agrupapiro/constants/enum/prioridade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap {'média'} text as the priority
Future<void> iTapTextAsThePriority(WidgetTester tester, String priority) async {
  // Encontra o DropdownButtonFormField para a prioridade
  final dropdownFinder = find.byType(DropdownButtonFormField<Priority>);

  // Certifica-se de que o dropdown foi encontrado
  expect(dropdownFinder, findsOneWidget);

  // Toca para abrir o Dropdown
  await tester.tap(dropdownFinder);
  await tester.pumpAndSettle(); // Aguarda a animação de abertura do dropdown

  // Encontra a opção de prioridade no dropdown e toca nela
  final optionFinder = find.text(priority).last;
  await tester.tap(optionFinder);
  await tester.pumpAndSettle(); // Aguarda a animação de fechamento do dropdown
}
