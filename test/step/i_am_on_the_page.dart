import 'package:flutter_test/flutter_test.dart';

/// Usage: I am on the {'Criar conta'} page
Future<void> iAmOnThePage(WidgetTester tester, String param1) async {
  // Verifica para qual página navegar baseado no parâmetro
  switch (param1) {
    case 'Criar conta':
      // Navega para a página de cadastro
      await tester.tap(find.text('Cadastrar'));
      await tester.pumpAndSettle();

      // Verifica se a página de cadastro foi carregada
      expect(find.text('Cadastro'), findsOneWidget);
      break;
      
    case 'Login':
      // Já está na página de Login, não precisa fazer nada
      expect(find.text('Login'), findsOneWidget);
      break;
      
    default:
      throw Exception('Página $param1 não é suportada nos testes.');
  }
}
