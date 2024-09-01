import 'package:agrupapiro/controllers/grupo_pesquisa_controller.dart';
import 'package:agrupapiro/models/grupo_pesquisa.dart';
import 'package:agrupapiro/services/sessao_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GrupoPesquisaNotifier extends StateNotifier<List<GrupoPesquisa>> {
  final GrupoPesquisaController grupoPesquisaController;
  final SessaoService sessaoService;

  GrupoPesquisaNotifier(this.grupoPesquisaController, this.sessaoService)
      : super([]) {
    _loadGrupos();
  }

  Future<void> _loadGrupos() async {
    final tokenSession = await sessaoService.getUserToken();
    if (tokenSession != null && tokenSession.isNotEmpty) {
      final grupos =
          await grupoPesquisaController.getGrupoPesquisaUsuario(tokenSession);
      state = grupos as List<GrupoPesquisa>; // Atualiza a lista de grupos
    }
  }

  Future<void> refreshGrupos() async {
    await _loadGrupos(); // Método para recarregar a lista de grupos
  }
}

final grupoPesquisaProvider =
    StateNotifierProvider<GrupoPesquisaNotifier, List<GrupoPesquisa>>((ref) {
  final grupoPesquisaController =
      ref.watch(grupoPesquisaControllerProvider.notifier);
  final sessaoService = ref.watch(sessaoServiceProvider);
  return GrupoPesquisaNotifier(grupoPesquisaController, sessaoService);
});
