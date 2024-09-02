import 'package:agrupapiro/constants/database_constants/database_usuario_sistema.dart';
import 'package:agrupapiro/data/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

Future<void> theUserIsRegisteredWithPassword(
    WidgetTester tester, String username, String password) async {
  // Inicializa o banco de dados em memória
  var dbHelper = DatabaseHelper();

  bool isDesktop() {
    // Verifica se está rodando em desktop
    return (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS);
  }

  if (isDesktop()) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  } else if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactory;
    dbHelper = DatabaseHelper();
    dbHelper.database;
  }

  // Recupera a instância do banco de dados
  final db = await dbHelper.initInMemoryDatabase();

  // Inserir o usuário no banco de dados
  await db.insert(kUSUARIOTABLENAME, {
    'nome': username,
    'email': '$username@mail.com', 
    'senha': password,
    'universidade': 'UFBA',
    'curso': 'Ciência da Computação',
    'periodo': '1',
    'telefone': '71999999999',
  });

  // Fecha o banco de dados após o teste
  addTearDown(() async {
    await dbHelper.close();
  });
}
