import 'package:agrupapiro/constants/database_constants/database_grupo_pesquisa.dart';
import 'package:agrupapiro/constants/database_constants/database_tarefa.dart';
import 'package:agrupapiro/constants/database_constants/database_tarefa_grupo_pesquisa.dart';
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

  Future<int> associarTarefaGrupo(String idTarefa, String idGrupo) async {
    Database db = await dbHelper.database;
    return await db.insert(
      kTAREFA_GRUPO_PESQUISA_TABLENAME,
      {
        kTAREFA_GRUPO_PESQUISA_TAREFA_ID: idTarefa,
        kTAREFA_GRUPO_PESQUISA_GRUPO_PESQUISA_ID: idGrupo,
      },
    );
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

  Future<List<Tarefa>> getTarefasPorGrupo(String idGrupo) async {
    try {
      Database db = await dbHelper.database;
      final List<Map<String, dynamic>> result = await db.rawQuery(
        '''
      SELECT DISTINCT t.* FROM $kTAREFA_TABLE_NAME t
      INNER JOIN $kTAREFA_GRUPO_PESQUISA_TABLENAME tgp 
        ON t.$kTAREFA_COLUMN_ID = tgp.$kTAREFA_GRUPO_PESQUISA_TAREFA_ID
      INNER JOIN $kGRUPO_PESQUISA_TABLE_NAME gp 
        ON gp.$kGRUPO_PESQUISA_ID = tgp.$kTAREFA_GRUPO_PESQUISA_GRUPO_PESQUISA_ID
      WHERE gp.$kGRUPO_PESQUISA_ID = ?
      ''',
        [idGrupo],
      );

      // Convertendo a lista de mapas para uma lista de objetos do tipo GrupoPesquisa
      return result.map((map) => Tarefa.fromMap(map)).toList();
    } catch (e) {
      // Log de erro e possível rethrow para que o erro seja tratado mais acima na cadeia
      print('Erro ao buscar grupos de pesquisa para o usuário: $e');
      rethrow;
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
