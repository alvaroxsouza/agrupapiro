import 'package:agrupapiro/models/Activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/providers/activity_notifier_provider.dart';
import 'package:agrupapiro/providers/user_notifier_provider.dart';
import '../enum/prioridade.dart';

class EditTaskPage extends ConsumerWidget {
  final Activity task;

  EditTaskPage({required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController(text: task.title);
    final descriptionController = TextEditingController(text: task.description);
    final deadlineController = TextEditingController(text: task.deadline.toIso8601String());
    var priority = task.prioridade;

    final currentUser = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            TextField(
              controller: deadlineController,
              decoration: const InputDecoration(
                labelText: 'Prazo (yyyy-MM-dd)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            
            const SizedBox(height: 16),
            DropdownButtonFormField<Priority>(
              value: priority,
              onChanged: (Priority? newValue) {
                if (newValue != null) {
                  priority = newValue;
                }
              },
              items: Priority.values.map((Priority priority) {
                return DropdownMenuItem<Priority>(
                  value: priority,
                  child: Text(priority.name),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Prioridade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (currentUser != null && currentUser.id == task.user.id) {
                    final updatedTask = Activity(
                      title: titleController.text,
                      description: descriptionController.text,
                      deadline: DateTime.parse(deadlineController.text),
                      prioridade: priority,
                      user: task.user,
                      color: task.color,
                    );

                    ref.read(activityProvider.notifier).updateActivity(task, updatedTask);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Você não tem permissão para atualizar esta tarefa.')),
                    );
                  }
                },
                child: const Text('Salvar Alterações'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
