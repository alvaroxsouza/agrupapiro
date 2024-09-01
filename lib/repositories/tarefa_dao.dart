import 'package:agrupapiro/data/database.dart';
import 'package:agrupapiro/models/tarefa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'tarefa_dao.g.dart';

class TarefaDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertTarefa(Tarefa tarefa) async {
    Database db = await dbHelper.database;
    return await db.insert('Tarefas', tarefa.toMap());
  }

  Future<List<Map<String, dynamic>>> getTarefas() async {
    Database db = await dbHelper.database;
    return await db.query('Tarefas');
  }

  Future<Map<String, dynamic>?> getById(String id) async {
    Database db = await dbHelper.database;
    List<Map<String, dynamic>> maps = await db.query(
      'Tarefas',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }

  Future<int> updateTarefa(Tarefa tarefa) async {
    Database db = await dbHelper.database;
    return await db.update(
      'Tarefas',
      tarefa.toMap(),
      where: 'id = ?',
      whereArgs: [tarefa.id],
    );
  }

  Future<int> deleteTarefa(String id) async {
    Database db = await dbHelper.database;
    return await db.delete(
      'Tarefas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

@Riverpod(keepAlive: true)
TarefaDao tarefaDao(TarefaDaoRef ref) {
  return TarefaDao();
}
