import 'package:agrupapiro/enum/rotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/group_components/button_menu_section.dart';

class GroupPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupo X'),
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
              route: Routes.ATIVIDADES,
              label: 'Atividade',
              color: Colors.amber,
            ),
            ButtonMenuSection(
              icon: Icons.book,
              route: Routes.ATIVIDADES,
              label: 'Materiais',
              color: Colors.green,
            ),
            ButtonMenuSection(
              icon: Icons.dashboard,
              route: Routes.ATIVIDADES,
              label: 'Painel',
              color: Colors.blueAccent,
            ),
            ButtonMenuSection(
              icon: Icons.people,
              route: Routes.ATIVIDADES,
              label: 'Membros',
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
