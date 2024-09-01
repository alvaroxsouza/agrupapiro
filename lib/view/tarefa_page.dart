import 'package:agrupapiro/constants/enum/rotas.dart';
import 'package:agrupapiro/models/tarefa.dart';
import 'package:agrupapiro/providers/tarefa_provider.dart';
import 'package:agrupapiro/view/create_tarefa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TarefaPage extends ConsumerWidget {
  final String idGrupo;

  const TarefaPage({
    super.key,
    required this.idGrupo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarefas = ref.watch(tarefaProvider(idGrupo));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividades'),
      ),
      body: tarefas.isEmpty
          ? const Center(child: Text('Nenhuma tarefa encontrada'))
          : ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                final Tarefa tarefa = tarefas[index];

                return ListTile(
                  title: Text(tarefa.titulo),
                  subtitle: Text(tarefa.descricao),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await ref
                          .read(tarefaProvider(idGrupo).notifier)
                          .deleteTarefa(tarefa.id);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateTarefa(idGrupo: idGrupo),
            ),
          );

          ref.read(tarefaProvider(idGrupo).notifier).refreshTarefas();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
