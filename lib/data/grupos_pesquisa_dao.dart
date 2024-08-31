import 'package:agrupapiro/data/database.dart';
import 'package:sqflite/sqflite.dart';

class GrupoPesquisaDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertGrupoPesquisa(Map<String, dynamic> grupo) async {
    Database db = await dbHelper.database;
    return await db.insert('GrupoPesquisa', grupo);
  }

  Future<List<Map<String, dynamic>>> getGruposPesquisa() async {
    Database db = await dbHelper.database;
    return await db.query('GrupoPesquisa');
  }

  Future<int> updateGrupoPesquisa(Map<String, dynamic> grupo) async {
    Database db = await dbHelper.database;
    return await db.update(
      'GrupoPesquisa',
      grupo,
      where: 'id = ?',
      whereArgs: [grupo['id']],
    );
  }

  Future<int> deleteGrupoPesquisa(int id) async {
    Database db = await dbHelper.database;
    return await db.delete(
      'GrupoPesquisa',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
