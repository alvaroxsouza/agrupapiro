import 'package:agrupapiro/constants/database_constants/database_grupo_pesquisa.dart';
import 'package:agrupapiro/constants/database_constants/database_usuario_sistema_grupo_pesquisa.dart';
import 'package:agrupapiro/data/database.dart';
import 'package:agrupapiro/models/grupo_pesquisa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'grupo_pesquisa_dao.g.dart';

class GrupoPesquisaDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertGrupoPesquisa(GrupoPesquisa grupoPesquisa) async {
    Database db = await dbHelper.database;
    return await db.insert(kGRUPO_PESQUISA_TABLE_NAME, grupoPesquisa.toMap());
  }

  Future<List<Map<String, dynamic>>> getGrupoPesquisa() async {
    Database db = await dbHelper.database;
    return await db.query(kGRUPO_PESQUISA_TABLE_NAME);
  }

  Future<Map<String, dynamic>?> getById(String id) async {
    Database db = await dbHelper.database;
    List<Map<String, dynamic>> maps = await db.query(
      kGRUPO_PESQUISA_TABLE_NAME,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }

  Future<int> updateGrupoPesquisa(GrupoPesquisa grupoPesquisa) async {
    Database db = await dbHelper.database;
    return await db.update(
      kGRUPO_PESQUISA_TABLE_NAME,
      grupoPesquisa.toMap(),
      where: 'id = ?',
      whereArgs: [grupoPesquisa.id],
    );
  }

  Future<int> deleteGrupoPesquisa(String id) async {
    Database db = await dbHelper.database;
    return await db.delete(
      kGRUPO_PESQUISA_TABLE_NAME,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  insertGrupoPesquisaUsuarioAdmin(String id, String idAdmin) async {
    Database db = await dbHelper.database;
    return await db.insert(
      kUSUARIO_GRUPO_PESQUISA_TABLENAME,
      {
        kUSUARIO_GRUPO_PESQUISA_GRUPO_PESQUISA_ID: id,
        kUSUARIO_GRUPO_PESQUISA_CPF: idAdmin
      },
    );
  }
}

@Riverpod(keepAlive: true)
GrupoPesquisaDao grupoPesquisaDao(GrupoPesquisaDaoRef ref) {
  return GrupoPesquisaDao();
}
