import 'package:agrupapiro/data/usuario_sistema_dao.dart';
import 'package:agrupapiro/models/usuario.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usuario_sistema_service.g.dart';

class UsuarioSistemaService {
  final UsuarioSistemaDao _dao;

  UsuarioSistemaService(this._dao);

  Future<int> insertUsuario(UsuarioSistema usuario) =>
      _dao.insertUsuario(usuario);

  Future<List> getUsuarios() => _dao.getUsuarios();

  Future<UsuarioSistema?> getById(String cpf) => _dao.getById(cpf);

  Future<UsuarioSistema?> getByEmail(String email) => _dao.getByEmail(email);

  Future<int> updateUsuario(UsuarioSistema usuario) =>
      _dao.updateUsuario(usuario);

  Future<int> deleteUsuario(String cpf) => _dao.deleteUsuario(cpf);
}

@Riverpod(keepAlive: true)
UsuarioSistemaService usuarioSistemaService(UsuarioSistemaServiceRef ref) {
  return UsuarioSistemaService(ref.watch(usuarioSistemaDaoProvider));
}
