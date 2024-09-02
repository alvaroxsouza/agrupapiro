import 'package:agrupapiro/constants/database_constants/database.dart';
import 'package:agrupapiro/models/tarefa.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';

/// Usage: there are tasks created in the system
Future<void> thereAreTasksCreatedInTheSystem(WidgetTester tester, {required String idGrupo}) async {
  // Obtém o caminho para o banco de dados
  final database = await openDatabase(kDATABASE_NOME);

  // Cria tarefas de exemplo para serem usadas nos testes
  final tarefasDeExemplo = [
    Tarefa(
      id: '1',
      titulo: 'Tarefa 1',
      descricao: 'Descrição da Tarefa 1',
      dataEntrega: '20/09/2024',
      dataCriacao: '15/09/2024',
      idGrupo: idGrupo,
      idUsuario: 'usuario1',
      status: 'pendente',
    ),
    Tarefa(
      id: '2',
      titulo: 'Tarefa 2',
      descricao: 'Descrição da Tarefa 2',
      dataEntrega: '22/09/2024',
      dataCriacao: '16/09/2024',
      idGrupo: idGrupo,
      idUsuario: 'usuario2',
      status: 'concluída',
    ),
    Tarefa(
      id: '3',
      titulo: 'Tarefa 3',
      descricao: 'Descrição da Tarefa 3',
      dataEntrega: '25/09/2024',
      dataCriacao: '17/09/2024',
      idGrupo: idGrupo,
      idUsuario: 'usuario3',
      status: 'em progresso',
    ),
  ];

  // Insere as tarefas diretamente no banco de dados SQLite
  for (var tarefa in tarefasDeExemplo) {
    await database.insert(
      'tarefas', // Nome da tabela
      tarefa.toMap(), // Dados da tarefa convertidos para um Map
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Libera o banco de dados após a inserção
  await database.close();
}
