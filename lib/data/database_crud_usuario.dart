import 'package:agrupapiro/data/database.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioSistemaDao {
  final dbHelper = DatabaseHelper();

  Future<int> insertUsuario(Map<String, dynamic> usuario) async {
    Database db = await dbHelper.database;
    return await db.insert('Usuario', usuario);
  }

  Future<List<Map<String, dynamic>>> getUsuarios() async {
    Database db = await dbHelper.database;
    return await db.query('Usuario');
  }

  Future<int> updateUsuario(Map<String, dynamic> usuario) async {
    Database db = await dbHelper.database;
    return await db.update(
      'Usuario',
      usuario,
      where: 'id = ?',
      whereArgs: [usuario['id']],
    );
  }

  Future<int> deleteUsuario(int id) async {
    Database db = await dbHelper.database;
    return await db.delete(
      'Usuario',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
