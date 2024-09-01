import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {'Email/Usuário'} input field
Future<void> iSeeInputField(WidgetTester tester, String labelText) async {
  // Encontra o TextField com o rótulo especificado
  final finder = find.widgetWithText(TextField, labelText);

  // Verifica se o TextField está presente na árvore de widgets
  expect(finder, findsOneWidget);
}
