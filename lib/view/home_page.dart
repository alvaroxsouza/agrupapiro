import 'package:agrupapiro/controllers/grupo_pesquisa_controller.dart';
import 'package:agrupapiro/services/sessao_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/home_components/group_container.dart';
import 'create_group_page.dart'; // Importar a página de criação de grupo

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("usuario"),
              accountEmail: Text("email@gmail.com"),
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
      body: FutureBuilder<String?>(
        future: ref.watch(sessaoServiceProvider).getUserToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar o token'));
          } else {
            final String? tokenSession = snapshot.data;

            if (tokenSession == null || tokenSession.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacementNamed('/');
              });
              return const SizedBox
                  .shrink(); // Evita que a UI seja desenhada enquanto redireciona
            }

            return FutureBuilder<List>(
              future: ref
                  .watch(grupoPesquisaControllerProvider.notifier)
                  .getGrupoPesquisaUsuario(tokenSession),
              builder: (context, groupSnapshot) {
                if (groupSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (groupSnapshot.hasError) {
                  return const Center(child: Text('Erro ao carregar grupos'));
                } else if (!groupSnapshot.hasData ||
                    groupSnapshot.data!.isEmpty) {
                  return const Center(child: Text('Nenhum grupo encontrado'));
                } else {
                  final groups = groupSnapshot.data!;
                  print(groups);
                  print(groups.length);
                  return ListView.builder(
                    itemCount: groups.length, // Agora com base nos dados reais
                    itemBuilder: (context, index) {
                      final group = groups[index];
                      return GroupContainer(
                        key: ValueKey(group.id),
                        id: group.id,
                        nome: group.nome,
                        sigla: group.sigla,
                        descricao: group.descricao,
                        dataCriacao: group.dataCriacao,
                        instituicao: group.instituicao,
                        departamento: group.departamento,
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para a tela de criação de grupo
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateGroupPage()),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
