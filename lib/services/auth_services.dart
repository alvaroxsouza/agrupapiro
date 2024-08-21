import 'package:agrupapiro/enum/permissoes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

class AuthService {
  // Função para registrar usuário
  Future<User?> registerUser(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email e senha são obrigatórios.');
      }

      // Simulação de criação de usuário
      final user = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        password:
            password, // simulação
        name: 'User',
        permissao: Permissoes.usuario, 
      );

      // Simulação de armazenamento de usuário
      return user;
    } catch (e) {
      print('Erro ao registrar usuário: $e');
      return null;
    }
  }

  //  login do usuário
  Future<User?> loginUser(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email e senha são obrigatórios.');
      }

      // Simulação de verificação de credenciais
      if (email == 'admin@ex.com' && password == 'admin123') {
        return User(
          id: 'admin1', 
          email: email,
          password:
              password, 
          name: 'Admin',
          permissao: Permissoes.admin, 
        );
      } else if (email == 'usuario@ex.com' && password == 'us123') {
        return User(
          id: 'user1', 
          email: email,
          password: password,
          name: 'usuario',
          permissao: Permissoes.usuario, 
        );
      }

      // Retorna null se as credenciais não corresponderem
      return null;
    } catch (e) {
      print('Erro ao fazer login: $e');
      return null;
    }
  }
}

// Criação do provider para AuthService
final authServiceProvider = Provider<AuthService>((ref) => AuthService());
