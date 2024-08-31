import 'package:agrupapiro/models/usuario.dart';
import 'package:agrupapiro/services/usuario_sistema_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usuario_sistema_controller.g.dart';

@Riverpod(keepAlive: true)
class UsuarioSistemaController extends _$UsuarioSistemaController {
  @override
  FutureOr<void> build() {
    // Este método pode ser utilizado para inicializar qualquer dado necessário no controlador
  }

  Future<int> addUsuario(UsuarioSistema usuario) async {
    final service = ref.read(usuarioSistemaServiceProvider);
    return await service.insertUsuario(usuario);
  }

  Future<List> fetchUsuarios() async {
    final service = ref.read(usuarioSistemaServiceProvider);
    return await service.getUsuarios();
  }

  Future<UsuarioSistema?> fetchUsuarioById(String cpf) async {
    final service = ref.read(usuarioSistemaServiceProvider);
    return await service.getById(cpf);
  }

  Future<UsuarioSistema?> fetchUsuarioByEmail(String email) async {
    final service = ref.read(usuarioSistemaServiceProvider);
    return await service.getByEmail(email);
  }

  Future<int> updateUsuario(UsuarioSistema usuario) async {
    final service = ref.read(usuarioSistemaServiceProvider);
    return await service.updateUsuario(usuario);
  }

  Future<int> removeUsuario(String cpf) async {
    final service = ref.read(usuarioSistemaServiceProvider);
    return await service.deleteUsuario(cpf);
  }
}
