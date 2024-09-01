import 'package:agrupapiro/main.dart'; // Certifique-se de que MyApp está sendo importado corretamente
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  // Defina o tamanho da janela para 1024x800 pixels, um tamanho maior que acomoda o botão
  tester.view.physicalSize = const Size(1024, 800);

  // Defina a densidade de pixels (1.0 simula uma densidade de 1:1, como em muitos dispositivos)
  tester.view.devicePixelRatio = 1.0;

  // Aplique as mudanças na configuração da janela
  await tester.pumpAndSettle();

  // Envolva o aplicativo com ProviderScope
  await tester.pumpWidget(
    const ProviderScope(
      child: MyApp(),
    ),
  );

  // Aguarde o ciclo de frames para garantir que tudo foi renderizado
  await tester.pumpAndSettle();
}
