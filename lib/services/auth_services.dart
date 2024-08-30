import 'package:agrupapiro/enum/permissoes.dart';
import 'package:agrupapiro/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        password: password, // simulação
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

  // Função de login do usuário
  Future<User?> loginUser(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email e senha são obrigatórios.');
      }

      // Simulação de verificação de credenciais
      if (email == 'admin@ex.com' && password == 'admin123') {
        return User(
          id: '2',
          email: email,
          password: password,
          name: 'Admin',
          permissao: Permissoes.admin,
        );
      } else if (email == 'usuario@ex.com' && password == 'us123') {
        return User(
          id: '1',
          email: email,
          password: password,
          name: 'Usuario',
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

  // Função para buscar usuários (simulação)
  Future<List<User>> fetchUsers() async {
    try {
      // Simulação de uma lista de usuários
      final List<User> users = [
        User(
          id: '1',
          email: 'usuario@ex.com',
          password: 'us123',
          name: 'Usuario',
          permissao: Permissoes.usuario,
        ),
        User(
          id: '2',
          email: 'admin@ex.com',
          password: 'admin123',
          name: 'Admin',
          permissao: Permissoes.admin,
        ),
        User(
          id: '3',
          email: 'gestor@ex.com',
          password: 'gestor123',
          name: 'Gestor',
          permissao: Permissoes.admin,
        ),
      ];

      return users;
    } catch (e) {
      print('Erro ao buscar usuários: $e');
      return [];
    }
  }
}

// Criação do provider para AuthService
final authServiceProvider = Provider<AuthService>((ref) => AuthService());
