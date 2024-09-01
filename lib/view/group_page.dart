import 'package:agrupapiro/constants/enum/rotas.dart';
import 'package:agrupapiro/view/tarefa_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/group_components/button_menu_section.dart';

class GroupPage extends ConsumerWidget {
  final String grupoId;
  final String nome;

  const GroupPage({super.key, required this.grupoId, required this.nome});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            ButtonMenuSection(
              icon: Icons.assignment,
              route: Routes.TAREFA,
              label: 'Atividade',
              color: Colors.amber,
              widgetComp: TarefaPage(idGrupo: grupoId),
            ),
            ButtonMenuSection(
              icon: Icons.book,
              route: Routes.TAREFA,
              label: 'Materiais',
              color: Colors.green,
              widgetComp: TarefaPage(idGrupo: grupoId),
            ),
            ButtonMenuSection(
              icon: Icons.dashboard,
              route: Routes.TAREFA,
              label: 'Painel',
              color: Colors.blueAccent,
              widgetComp: TarefaPage(idGrupo: grupoId),
            ),
            ButtonMenuSection(
              icon: Icons.people,
              route: Routes.TAREFA,
              label: 'Membros',
              color: Colors.pink,
              widgetComp: TarefaPage(idGrupo: grupoId),
            ),
          ],
        ),
      ),
    );
  }
}
