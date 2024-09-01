import 'package:agrupapiro/main.dart'; // Certifique-se de que MyApp está sendo importado corretamente
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  // Envolva o aplicativo com ProviderScope
  await tester.pumpWidget(
    const ProviderScope(
      child: MyApp(),
    ),
  );

  // Aguarde o ciclo de frames para garantir que tudo foi renderizado
  await tester.pumpAndSettle();
}
