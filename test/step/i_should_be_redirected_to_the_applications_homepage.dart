import 'package:agrupapiro/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should be redirected to the application's homepage
Future<void> iShouldBeRedirectedToTheApplicationsHomepage(
    WidgetTester tester) async {

  // Verifica se a HomePage está na árvore de widgets
  expect(find.byType(HomePage), findsOneWidget);

  // Verifica se um widget específico da HomePage está presente, por exemplo, o AppBar com o título 'Home'
  expect(find.text('Home'), findsOneWidget);

  // Se tiver um FloatingActionButton que só aparece na HomePage, pode-se verificar também
  expect(find.byIcon(Icons.add), findsOneWidget);
}
