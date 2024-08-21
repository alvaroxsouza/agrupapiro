import 'package:agrupapiro/enum/permissoes.dart';
import 'package:agrupapiro/models/Activity.dart';
import 'package:agrupapiro/providers/activity_notifier_provider.dart';
import 'package:agrupapiro/providers/user_notifier_provider.dart';
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

    return Scaffold(
      backgroundColor: activity.color.shade50,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,

        //apagar tarefa
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
          ],
        ),
      ),
    );
  }
}
