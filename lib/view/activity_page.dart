import 'package:agrupapiro/view/activity_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'create_task_page.dart';
import 'package:agrupapiro/providers/activity_notifier_provider.dart';

class ActivityPage extends ConsumerWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obter a lista de tarefas do provider
    final activities = ref.watch(activityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividades'),
      ),
      body: activities.isEmpty
          ? const Center(
              child: Text('Nenhuma tarefa encontrada.'),
            )
          : ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(activity.title,
                        style: Theme.of(context).textTheme.titleMedium),

                        
                    subtitle: Text(
                      '${activity.description}\n'
                      'Prazo: ${activity.deadline.toLocal().toString().split(' ')[0]}\n'
                      'Prioridade: ${activity.prioridade.name}\n'
                      'Status: ${activity.status.name}', // Exibindo o status da tarefa
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),


                    trailing: const Icon(Icons.task),
                    onTap: () {
                      // Navegar para a página de detalhes da atividade
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ActivityDetailsPage(activity: activity),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para a tela de criação de tarefas
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTaskPage()),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
