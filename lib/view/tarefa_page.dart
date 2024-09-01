import 'package:agrupapiro/models/tarefa.dart';
import 'package:agrupapiro/repositories/tarefa_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TarefaPage extends ConsumerWidget {
  final String idGrupo;

  const TarefaPage({
    Key? key,
    required this.idGrupo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividades'),
      ),
      body: FutureBuilder<List<Tarefa>>(
        future: ref.watch(tarefaDaoProvider).getTarefasPorGrupo(idGrupo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar as tarefas'));
          } else {
            final List<Tarefa> tarefas = snapshot.data!;

            return ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                final Tarefa tarefa = tarefas[index];

                return ListTile(
                  title: Text(tarefa.titulo),
                  subtitle: Text(tarefa.descricao),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref.watch(tarefaDaoProvider).deleteTarefa(tarefa.id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
