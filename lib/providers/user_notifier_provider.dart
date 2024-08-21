
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/models/user.dart';
import 'package:agrupapiro/services/auth_services.dart';

// Notifier para gerenciar o estado do usuário
class UserNotifier extends StateNotifier<User?> {
  UserNotifier(this._authService) : super(null);

  final AuthService _authService;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // Função para login
  Future<bool> login(String email, String password) async {
    try {
      _isLoading = true;
      final user = await _authService.loginUser(email, password);
      if (user != null) {
        state = user;
        return true;
      }
      return false;
    } catch (e) {
      // Tratar exceção 
      return false;
    } finally {
      _isLoading = false;
    }
  }

  // Função para criar conta
  Future<bool> createAccount(String email, String password) async {
    try {
      _isLoading = true;
      state = null; // Limpando o estado do usuário durante o processo
      final newUser = await _authService.registerUser(email, password);
      if (newUser != null) {
        state = newUser;
        return true;
      }
      return false;
    } catch (e) {
      // Tratar exceção 
      return false;
    } finally {
      _isLoading = false;
    }
  }
}

// Provider para UserNotifier
final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier(AuthService());
});

