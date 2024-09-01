import 'package:agrupapiro/models/grupo_pesquisa.dart';
import 'package:agrupapiro/services/grupo_pesquisa_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grupo_pesquisa_controller.g.dart';

@Riverpod(keepAlive: true)
class GrupoPesquisaController extends _$GrupoPesquisaController {
  // O Riverpod automaticamente fornecerá o ref aqui.

  @override
  FutureOr<void> build() {
    // Inicialização, se necessário.
  }

  Future<int> insertGrupoPesquisa(GrupoPesquisa grupoPesquisa) async {
    final grupoPesquisaService = ref.read(grupoPesquisaServiceProvider);
    return await grupoPesquisaService.insertGrupoPesquisa(grupoPesquisa);
  }

  Future<int> insertGrupoPesquisaUsuarioAdmin(
      String idGrupoPesquisa, String idAdmin) async {
    final grupoPesquisaService = ref.read(grupoPesquisaServiceProvider);
    return await grupoPesquisaService.insertGrupoPesquisaUsuarioAdmin(
      idGrupoPesquisa,
      idAdmin,
    );
  }

  Future<List> getGrupoPesquisa() async {
    final grupoPesquisaService = ref.read(grupoPesquisaServiceProvider);
    return await grupoPesquisaService.getGrupoPesquisa();
  }

  Future<Map<String, dynamic>?> getById(String id) async {
    final grupoPesquisaService = ref.read(grupoPesquisaServiceProvider);
    return await grupoPesquisaService.getById(id);
  }

  Future<int> updateGrupoPesquisa(GrupoPesquisa grupoPesquisa) async {
    final grupoPesquisaService = ref.read(grupoPesquisaServiceProvider);
    return await grupoPesquisaService.updateGrupoPesquisa(grupoPesquisa);
  }

  Future<int> deleteGrupoPesquisa(String id) async {
    final grupoPesquisaService = ref.read(grupoPesquisaServiceProvider);
    return await grupoPesquisaService.deleteGrupoPesquisa(id);
  }
}
