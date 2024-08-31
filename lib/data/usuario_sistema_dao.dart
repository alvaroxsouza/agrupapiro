import 'package:agrupapiro/data/database.dart';
import 'package:agrupapiro/models/usuario.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioSistemaDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertUsuario(UsuarioSistema usuario) async {
    Database db = await dbHelper.database;
    int id = await db.insert('Usuario', usuario.toMap());
    return id;
  }

  Future<List> getUsuarios() async {
    Database db = await dbHelper.database;
    var usuario = await db.query('Usuario');
    List usuarios = usuario.isNotEmpty
        ? usuario.map((c) => UsuarioSistema.fromMap(c)).toList()
        : [];

    return usuarios;
  }

  Future<UsuarioSistema?> getById(String cpf) async {
    Database db = await dbHelper.database;
    List<Map> maps = await db.query(
      'Usuario',
      where: 'cpf = ?',
      whereArgs: [cpf],
    );

    if (maps.isNotEmpty) {
      return UsuarioSistema.fromMap(maps.first as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<int> updateUsuario(UsuarioSistema usuario) async {
    Database db = await dbHelper.database;
    return await db.update(
      'Usuario',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.cpf],
    );
  }

  Future<int> deleteUsuario(String cpf) async {
    Database db = await dbHelper.database;
    return await db.delete(
      'Usuario',
      where: 'cpf = ?',
      whereArgs: [cpf],
    );
  }
}
