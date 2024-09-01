import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap {'Login'} button
Future<void> iTapButton(WidgetTester tester, String param1) async {
  // Encontra o botão baseado no texto fornecido
  final button = find.widgetWithText(ElevatedButton, param1);
  
  // Verifica se o botão foi encontrado
  expect(button, findsOneWidget, reason: 'Botão $param1 não foi encontrado.');

  // Simula o toque no botão
  await tester.tap(button);

  // Aguarda para que todas as animações e eventos sejam processados
  await tester.pumpAndSettle();
}
