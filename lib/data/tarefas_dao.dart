import 'package:agrupapiro/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TarefasDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertTarefa(Map<String, dynamic> tarefa) async {
    Database db = await dbHelper.database;
    return await db.insert('Tarefas', tarefa);
  }

  Future<List<Map<String, dynamic>>> getTarefas() async {
    Database db = await dbHelper.database;
    return await db.query('Tarefas');
  }

  Future<int> updateTarefa(Map<String, dynamic> tarefa) async {
    Database db = await dbHelper.database;
    return await db.update(
      'Tarefas',
      tarefa,
      where: 'id = ?',
      whereArgs: [tarefa['id']],
    );
  }

  Future<int> deleteTarefa(int id) async {
    Database db = await dbHelper.database;
    return await db.delete(
      'Tarefas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
