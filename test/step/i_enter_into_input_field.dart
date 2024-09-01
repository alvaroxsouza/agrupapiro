import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Example: When I enter {'text'} into {1} input field
Future<void> iEnterIntoInputField(
  WidgetTester tester,
  String text,
  int index,
) async {
  // Encontra o campo de entrada de texto baseado no índice
  final textField = find.byType(TextField).at(index);

  // Insere o texto no campo de entrada identificado
  await tester.enterText(textField, text);

  // Aguarda o ciclo de frames para garantir que a alteração foi aplicada
  await tester.pumpAndSettle();
}
