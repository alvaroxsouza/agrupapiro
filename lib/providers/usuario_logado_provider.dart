import 'package:agrupapiro/models/usuario.dart';
import 'package:agrupapiro/services/sessao_service.dart';
import 'package:agrupapiro/services/usuario_sistema_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsuarioLogadoNotifier extends StateNotifier<UsuarioSistema?> {
  final SessaoService sessaoService;
  final UsuarioSistemaService serviceUsuario;
  UsuarioSistema? usuario;

  UsuarioLogadoNotifier(this.sessaoService, this.serviceUsuario) : super(null) {
    _loadUsuario();
  }

  Future<void> _loadUsuario() async {
    try {
      final tokenSession = await sessaoService.getUserToken();
      if (tokenSession != null && tokenSession.isNotEmpty) {
        final tokenUsuario = await sessaoService.getUserToken();
        if (tokenUsuario != null) {
          usuario = await serviceUsuario.getById(tokenUsuario);
        } else {
          usuario = null;
        }
        state = usuario;
      }
    } catch (e) {
      state = null;
      print('Erro ao carregar usuário logado: $e');
    }
  }

  Future<void> logout() async {
    try {
      await sessaoService.logoutUser();
      state = null; // Desloga o usuário
    } catch (e) {
      print('Erro ao fazer logout: $e');
    }
  }

  Future<void> refreshUsuario() async {
    await _loadUsuario(); // Recarrega as informações do usuário logado
  }
}

final usuarioLogadoProvider =
    StateNotifierProvider<UsuarioLogadoNotifier, UsuarioSistema?>((ref) {
  final sessaoService = ref.watch(sessaoServiceProvider);
  final serviceUsuario = ref.watch(usuarioSistemaServiceProvider);
  return UsuarioLogadoNotifier(sessaoService, serviceUsuario);
});
