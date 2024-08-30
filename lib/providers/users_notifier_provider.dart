import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/models/user.dart';
import 'package:agrupapiro/services/auth_services.dart';

// Notifier para gerenciar a lista de usuários
class UsersNotifier extends StateNotifier<List<User>> {
  UsersNotifier(this._authService) : super([]) {
    _loadUsers();
  }

  final AuthService _authService;

  // Carregar usuários
  Future<void> _loadUsers() async {
    try {
      final users = await _authService.fetchUsers(); // Ajuste conforme sua API
      state = users;
    } catch (e) {
      // Tratar exceção
    }
  }
}

// Provider para UsersNotifier
final usersProvider = StateNotifierProvider<UsersNotifier, List<User>>((ref) {
  return UsersNotifier(AuthService());
});
