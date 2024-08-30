import 'package:agrupapiro/enum/permissoes.dart';
import 'package:agrupapiro/enum/status_activity.dart';
import 'package:agrupapiro/models/Activity.dart';
import 'package:agrupapiro/providers/activity_notifier_provider.dart';
import 'package:agrupapiro/providers/user_notifier_provider.dart';
import 'package:agrupapiro/providers/users_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/models/user.dart';
import '../enum/prioridade.dart';

class CreateTaskPage extends ConsumerWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  Priority _selectedPriority = Priority.media;
  Status _selectedStatus = Status.pendente; // Novo campo para status
  User? _selectedUser;

  CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);

    final currentUser = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _deadlineController,
              decoration: const InputDecoration(
                labelText: 'Prazo (dd/mm/yyyy)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira uma data.';
                }
                final dateParts = value.split('/');
                if (dateParts.length != 3) {
                  return 'Data deve estar no formato dd/mm/yyyy.';
                }
                final day = int.tryParse(dateParts[0]);
                final month = int.tryParse(dateParts[1]);
                final year = int.tryParse(dateParts[2]);
                if (day == null ||
                    month == null ||
                    year == null ||
                    day < 1 ||
                    month < 1 ||
                    month > 12) {
                  return 'Data inválida.';
                }
                try {
                  final date = DateTime(year, month, day);
                  if (date.year != year ||
                      date.month != month ||
                      date.day != day) {
                    return 'Data inválida.';
                  }
                } catch (e) {
                  return 'Data inválida.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Priority>(
              value: _selectedPriority,
              onChanged: (Priority? newValue) {
                if (newValue != null) {
                  _selectedPriority = newValue;
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
            DropdownButtonFormField<User>(
              value: _selectedUser,
              onChanged: (User? newValue) {
                _selectedUser = newValue;
              },
              items: users.map((User user) {
                return DropdownMenuItem<User>(
                  value: user,
                  child: Text(user.name),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Responsável',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Status>(
              value: _selectedStatus, // Novo Dropdown para Status
              onChanged: (Status? newValue) {
                if (newValue != null) {
                  _selectedStatus = newValue;
                }
              },
              items: Status.values.map((Status status) {
                return DropdownMenuItem<Status>(
                  value: status,
                  child: Text(status.name),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Status da Tarefa', // Novo campo para Status
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (currentUser?.permissao == Permissoes.admin) {
                    final title = _titleController.text;
                    final description = _descriptionController.text;
                    final deadlineString = _deadlineController.text;
                    final dateParts = deadlineString.split('/');

                    if (dateParts.length != 3) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Data deve estar no formato dd/mm/yyyy.')),
                      );
                      return;
                    }

                    final day = int.tryParse(dateParts[0]);
                    final month = int.tryParse(dateParts[1]);
                    final year = int.tryParse(dateParts[2]);

                    if (day == null ||
                        month == null ||
                        year == null ||
                        day < 1 ||
                        month < 1 ||
                        month > 12) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data inválida.')),
                      );
                      return;
                    }

                    DateTime? deadline;
                    try {
                      deadline = DateTime(year, month, day);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data inválida.')),
                      );
                      return;
                    }

                    final priority = _selectedPriority;
                    final user = _selectedUser;
                    final status = _selectedStatus; // Novo campo para Status

                    if (title.isNotEmpty &&
                        description.isNotEmpty &&
                        user != null) {
                      final newActivity = Activity(
                        id: DateTime.now()
                            .millisecondsSinceEpoch, // Gera um ID único
                        title: title,
                        description: description,
                        deadline: deadline,
                        prioridade: priority,
                        user: user,
                        color: Colors.blueGrey,
                        status: status, // Define o status ao criar a tarefa
                      );

                      ref
                          .read(activityProvider.notifier)
                          .addActivity(newActivity);
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Por favor, preencha todos os campos obrigatórios.')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Você não tem permissão para criar tarefas.')),
                    );
                  }
                },
                child: const Text('Salvar Tarefa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
