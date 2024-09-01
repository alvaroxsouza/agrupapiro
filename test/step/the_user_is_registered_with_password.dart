import 'package:agrupapiro/data/database.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> theUserIsRegisteredWithPassword(
    WidgetTester tester, String username, String password) async {

  // Inicializa o banco de dados em memória
  final dbHelper = DatabaseHelper();
  //TODO: Implementar em memória
  await dbHelper.initInMemoryDatabase();

  // Recupera a instância do banco de dados
  final db = await dbHelper.database;

  // Inserir o usuário no banco de dados
  await db.insert('usuarios', {
    'nome': username,
    'email': username,  // Assumindo que o nome de usuário também seja o email
    'senha': password,
  });

  // Adicionar tearDown para fechar o banco de dados após o teste
  addTearDown(() async {
    await dbHelper.close();
  });
}
