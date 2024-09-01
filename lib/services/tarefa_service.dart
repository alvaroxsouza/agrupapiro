import 'package:agrupapiro/data/tarefa_dao.dart';
import 'package:agrupapiro/models/tarefa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tarefa_service.g.dart';

class TarefaService {
  final TarefaDao _dao;

  TarefaService(this._dao);

  Future<int> insertTarefa(Tarefa tarefa) => _dao.insertTarefa(tarefa);

  Future<List> getTarefa() => _dao.getTarefas();

  Future<Map<String, dynamic>?> getById(String id) => _dao.getById(id);

  Future<int> updateTarefa(Tarefa tarefa) => _dao.updateTarefa(tarefa);

  Future<int> deleteTarefa(String id) => _dao.deleteTarefa(id);
}

@Riverpod(keepAlive: true)
TarefaService tarefaService(TarefaServiceRef ref) {
  return TarefaService(ref.watch(tarefaDaoProvider));
}
