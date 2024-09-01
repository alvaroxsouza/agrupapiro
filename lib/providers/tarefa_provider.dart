import 'package:agrupapiro/models/tarefa.dart';
import 'package:agrupapiro/repositories/tarefa_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TarefaNotifier extends StateNotifier<List<Tarefa>> {
  final TarefaDao tarefaDao;
  final String idGrupo;

  TarefaNotifier(this.tarefaDao, this.idGrupo) : super([]) {
    _loadTarefas();
  }

  Future<void> _loadTarefas() async {
    final tarefas = await tarefaDao.getTarefasPorGrupo(idGrupo);
    state = tarefas; // Atualiza a lista de tarefas
  }

  Future<void> refreshTarefas() async {
    await _loadTarefas(); // Método para recarregar a lista de tarefas
  }

  Future<void> deleteTarefa(String idTarefa) async {
    await tarefaDao.deleteTarefa(idTarefa);
    await _loadTarefas(); // Recarrega a lista após a exclusão de uma tarefa
  }
}

final tarefaProvider =
    StateNotifierProvider.family<TarefaNotifier, List<Tarefa>, String>(
        (ref, idGrupo) {
  final tarefaDao = ref.watch(tarefaDaoProvider);
  return TarefaNotifier(tarefaDao, idGrupo);
});
