import 'package:agrupapiro/data/database.dart';
import 'package:agrupapiro/models/usuario.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'usuario_sistema_dao.g.dart';

class UsuarioSistemaDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertUsuario(UsuarioSistema usuario) async {
    Database db = await dbHelper.database;
    return await db.insert('usuario_sistema', usuario.toMap());
  }

  Future<List> getUsuarios() async {
    Database db = await dbHelper.database;
    var usuario = await db.query('usuario_sistema');
    List usuarios = usuario.isNotEmpty
        ? usuario.map((c) => UsuarioSistema.fromMap(c)).toList()
        : [];

    return usuarios;
  }

  Future<UsuarioSistema?> getById(String cpf) async {
    Database db = await dbHelper.database;
    List<Map> maps = await db.query(
      'usuario_sistema',
      where: 'cpf = ?',
      whereArgs: [cpf],
    );

    if (maps.isNotEmpty) {
      return UsuarioSistema.fromMap(maps.first as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<UsuarioSistema?> getByEmail(String email) async {
    Database db = await dbHelper.database;
    List<Map> maps = await db.query(
      'usuario_sistema',
      where: 'email = ?',
      whereArgs: [email],
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
      'usuario_sistema',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.cpf],
    );
  }

  Future<int> deleteUsuario(String cpf) async {
    Database db = await dbHelper.database;
    return await db.delete(
      'usuario_sistema',
      where: 'cpf = ?',
      whereArgs: [cpf],
    );
  }
}

@Riverpod(keepAlive: true)
UsuarioSistemaDao usuarioSistemaDao(UsuarioSistemaDaoRef ref) {
  return UsuarioSistemaDao();
}
