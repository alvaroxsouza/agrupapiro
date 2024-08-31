
// class GruposPesquisaService {
//   final GruposPesquisaRepository _repository;

//   GruposPesquisaService(this._repository);

//   Future<List<GrupoPesquisa>> getGruposPesquisa() async {
//     return await _repository.getGruposPesquisa();
//   }

//   Future<void> addGrupoPesquisa(GrupoPesquisa grupoPesquisa) async {
//     await _repository.addGrupoPesquisa(grupoPesquisa);
//   }

//   Future<void> removeGrupoPesquisa(GrupoPesquisa grupoPesquisa) async {
//     await _repository.removeGrupoPesquisa(grupoPesquisa);
//   }

//   Future<void> editGrupoPesquisa(GrupoPesquisa grupoPesquisa) async {
//     await _repository.editGrupoPesquisa(grupoPesquisa);
//   }
// }

// import 'repository.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'domain.dart';

// part 'service.g.dart';

// class TaskListService {
//   final TaskPreferences taskDao;

//   TaskListService({required this.taskDao});

//   Future<List<Task>> get tasks {
//     return taskDao.findAllTasks();
//   }

//   Future<void> addTask(Task task) async {
//     try {
//       await taskDao.insertTask(task);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> removeTask(Task task) async {
//     taskDao.deleteTask(task);
//   }

//   void editTask(Task task, {String? description, bool? completed}) {
//     final newTask = task.copyWith(
//         description: description ?? task.description,
//         completed: completed ?? task.completed);
//     taskDao.updateTask(task, newTask);
//   }
// }

// @Riverpod(keepAlive: true)
// TaskListService taskListService(TaskListServiceRef ref) {
//   final prefs = ref.watch(taskPreferencesProvider);
//   return TaskListService(taskDao: prefs);
// }