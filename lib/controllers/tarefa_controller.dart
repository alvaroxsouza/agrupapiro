import 'package:agrupapiro/models/tarefa.dart';
import 'package:agrupapiro/services/tarefa_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tarefa_controller.g.dart';

@Riverpod(keepAlive: true)
class TarefaController extends _$TarefaController {
  @override
  FutureOr<void> build() {
    // Este método pode ser utilizado para inicializar qualquer dado necessário no controlador
  }

  Future<int> addTarefa(Tarefa tarefa) async {
    final service = ref.read(tarefaServiceProvider);
    return await service.insertTarefa(tarefa);
  }

  Future<List> fetchTarefas() async {
    final service = ref.read(tarefaServiceProvider);
    return await service.getTarefa();
  }

  Future<Map<String, dynamic>?> fetchTarefaById(String id) async {
    final service = ref.read(tarefaServiceProvider);
    return await service.getById(id);
  }

  Future<int> updateTarefa(Tarefa tarefa) async {
    final service = ref.read(tarefaServiceProvider);
    return await service.updateTarefa(tarefa);
  }

  Future<int> removeTarefa(String id) async {
    final service = ref.read(tarefaServiceProvider);
    return await service.deleteTarefa(id);
  }

  // Future<List> fetchTarefasByUser(String cpf) async {
  //   final service = ref.read(tarefaServiceProvider);
  //   return await service.getTarefasByUser(cpf);
  // }

  // Future<List> fetchTarefasByGroup(String id) async {
  //   final service = ref.read(tarefaServiceProvider);
  //   return await service.getTarefasByGroup(id);
  // }
}