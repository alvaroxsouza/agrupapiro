import 'package:agrupapiro/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iAmLoggedInAs(WidgetTester tester, String userRole) async {
  // Obtém o container do Riverpod para manipular o estado dos providers
  final container = ProviderContainer();

  //TODO: Adicionar o login
  // Define o estado de autenticação como logado com o usuário especificado
  final authService = container.read(authServiceProvider);

  // Simula um usuário logado de acordo com a função fornecida
  switch (userRole) {
    case 'Administrador Geral':
      await authService.login(
          'admin@example.com', 'password'); // Ajuste conforme necessário
      break;
    // Adicione outros casos se houver outros tipos de usuários
    default:
      throw UnimplementedError('Usuário $userRole não implementado');
  }

  // Usa o container como contexto de testes para garantir que o estado do provider é considerado
  addTearDown(container.dispose);
}
