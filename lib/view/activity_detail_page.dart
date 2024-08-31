import 'package:agrupapiro/constants/enum/permissoes.dart';
import 'package:agrupapiro/constants/enum/status_activity.dart';
import 'package:agrupapiro/models/Activity.dart';
import 'package:agrupapiro/models/user.dart';
import 'package:agrupapiro/providers/activity_notifier_provider.dart';
import 'package:agrupapiro/providers/user_notifier_provider.dart';
import 'package:agrupapiro/providers/users_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityDetailsPage extends ConsumerWidget {
  final Activity activity;

  const ActivityDetailsPage({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);
    final users = ref.watch(usersProvider);

    return Scaffold(
      backgroundColor: activity.color.shade50,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        actions: [
          if (currentUser?.permissao == Permissoes.admin)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                ref.read(activityProvider.notifier).removeActivity(activity);
                Navigator.pop(context);
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: ListView(
          children: [
            // Título da Atividade
            Text(
              activity.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(height: 36),

            // Detalhes da Atividade
            Text(
              'Responsável: ${activity.user.name}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),

            Text(
              'Prazo: ${activity.deadline.toLocal().toString().split(' ')[0]}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),

            Text(
              'Prioridade: ${activity.prioridade.name}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Divider(height: 36),

            // Descrição da Atividade
            Text(activity.description),

            const SizedBox(height: 24),

            // Verifica se o usuário atual pode atualizar o status
            if (currentUser?.permissao == Permissoes.admin ||
                currentUser?.id == activity.user.id) ...[
              Text('Atualizar Status:',
                  style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 12),

              // Dropdown para selecionar novo status
              DropdownButtonFormField<Status>(
                value: activity.status,
                onChanged: (Status? newStatus) {
                  if (newStatus != null) {
                    final updatedActivity =
                        activity.copyWith(status: newStatus);
                    ref
                        .read(activityProvider.notifier)
                        .updateActivity(activity.id, updatedActivity);
                  }
                },
                items: Status.values.map((Status status) {
                  return DropdownMenuItem<Status>(
                    value: status,
                    child: Text(status.name),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Dropdown para selecionar novo responsável
              Text('Alterar Responsável:',
                  style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 12),

              DropdownButtonFormField<User>(
                value: users.firstWhere((user) => user.id == activity.user.id,
                    orElse: () => User(
                        id: '',
                        name: 'N/A',
                        email: '',
                        password: '',
                        permissao: Permissoes.usuario)), // Default value
                onChanged: (User? newUser) {
                  if (newUser != null &&
                      currentUser?.permissao == Permissoes.admin) {
                    final updatedActivity = activity.copyWith(user: newUser);
                    ref
                        .read(activityProvider.notifier)
                        .updateActivity(activity.id, updatedActivity);
                  }
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
            ],
          ],
        ),
      ),
    );
  }
}
