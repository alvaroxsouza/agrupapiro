import 'package:agrupapiro/models/usuario.dart';
import 'package:agrupapiro/providers/grupo_pesquisa_provider.dart';
import 'package:agrupapiro/services/sessao_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/home_components/group_container.dart';
import 'create_group_page.dart'; // Importar a página de criação de grupo

class HomePage extends ConsumerWidget {
  UsuarioSistema? usuario;

  HomePage({super.key, this.usuario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(grupoPesquisaProvider);

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(usuario!.nome),
              accountEmail: Text(usuario!.email),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Sair"),
              onTap: () {
                ref.read(sessaoServiceProvider).logoutUser();
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red,
      ),
      body: groups.isEmpty
          ? const Center(child: Text('Nenhum grupo encontrado'))
          : ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final group = groups[index];
                return GroupContainer(
                  id: group.id,
                  nome: group.nome,
                  sigla: group.sigla,
                  descricao: group.descricao,
                  dataCriacao: group.dataCriacao,
                  instituicao: group.instituicao,
                  departamento: group.departamento,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navegar para a tela de criação de grupo e recarregar grupos ao retornar
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateGroupPage()),
          );
          ref
              .read(grupoPesquisaProvider.notifier)
              .refreshGrupos(); // Recarrega os grupos
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
