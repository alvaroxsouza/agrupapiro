import 'package:agrupapiro/constants/database_constants/database.dart';
import 'package:agrupapiro/constants/database_constants/database_grupo_pesquisa.dart';
import 'package:agrupapiro/constants/database_constants/database_tarefa_grupo_pesquisa.dart';
import 'package:agrupapiro/constants/database_constants/database_tarefa.dart';
import 'package:agrupapiro/constants/database_constants/database_usuario_sistema.dart';
import 'package:agrupapiro/constants/database_constants/database_usuario_sistema_grupo_pesquisa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(
      await getDatabasesPath(),
      kDATABASE_NOME,
    );
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      // onUpgrade: _onUpgrade, // Para futuras atualizações de versão
    );
  }

  // Inicializa as tabelas do banco de dados
  Future<void> _onCreate(Database db, int version) async {
    // Criar tabela Usuario
    await db.execute(kUSUARIO_CREATE_TABLE);
    // Criar tabela GrupoPesquisa
    await db.execute(kGRUPO_PESQUISA_CREATE_TABLE);
    // Criar tabela Tarefas
    await db.execute(kTAREFA_CREATE_TABLE);
    // Criar tabela UsuarioGrupoPesquisa
    await db.execute(kUSUARIO_GRUPO_PESQUISA_CREATE_TABLE);
    // Criar tabela TarefaGrupoPesquisa
    await db.execute(kTAREFA_GRUPO_PESQUISA_CREATE_TABLE);
  }

  Future<void> printDatabasePath() async {
    String path = join(await getDatabasesPath(), kDATABASE_NOME);
    print('Caminho do banco de dados: $path');
  }

  // Fechar o banco de dados
  Future<void> close() async {
    Database db = await database;
    await db.close();
  }
}
