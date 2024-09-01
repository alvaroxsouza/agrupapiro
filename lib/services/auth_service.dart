import 'package:agrupapiro/repositories/usuario_sistema_dao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  final UsuarioSistemaDao _dao;

  AuthService(this._dao);

  Future<bool> login(String email, String senha) async {
    final usuario = await _dao.getByEmail(email);

    if (usuario != null && usuario.senha == senha) {
      return true;
    }

    return false;
  }
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService(ref.watch(usuarioSistemaDaoProvider));
}
