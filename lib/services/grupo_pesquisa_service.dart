import 'package:agrupapiro/repositories/grupo_pesquisa_dao.dart';
import 'package:agrupapiro/models/grupo_pesquisa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grupo_pesquisa_service.g.dart';

class GrupoPesquisaService {
  final GrupoPesquisaDao _dao;

  GrupoPesquisaService(this._dao);

  Future<int> insertGrupoPesquisa(GrupoPesquisa grupoPesquisa) async {
    return await _dao.insertGrupoPesquisa(grupoPesquisa);
  }

  Future<List> getGrupoPesquisa() => _dao.getGrupoPesquisa();

  Future<Map<String, dynamic>?> getById(String id) => _dao.getById(id);

  Future<int> updateGrupoPesquisa(GrupoPesquisa grupoPesquisa) =>
      _dao.updateGrupoPesquisa(grupoPesquisa);

  Future<int> deleteGrupoPesquisa(String id) => _dao.deleteGrupoPesquisa(id);

  Future<int> insertGrupoPesquisaUsuarioAdmin(String id, String idAdmin) =>
      _dao.insertGrupoPesquisaUsuarioAdmin(id, idAdmin);
}

@Riverpod(keepAlive: true)
GrupoPesquisaService grupoPesquisaService(GrupoPesquisaServiceRef ref) {
  return GrupoPesquisaService(ref.watch(grupoPesquisaDaoProvider));
}
