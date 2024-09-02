import 'package:agrupapiro/constants/enum/rotas.dart';
import 'package:agrupapiro/controllers/grupo_pesquisa_controller.dart';
import 'package:agrupapiro/controllers/usuario_sistema_controller.dart';
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
    void _showEmailModal(BuildContext context) {
      final email = TextEditingController();
      showModalBottomSheet(
        context: context,
        isScrollControlled:
            true, // Permite que o modal seja rolado com o teclado
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Ajusta o modal com base no teclado
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Digite o email do usuário para adicionar ao grupo',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'email@exemplo.com',
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancelar'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () async {
                            final result = await ref
                                .read(usuarioSistemaControllerProvider.notifier)
                                .fetchUsuarioByEmail(email.text);
                            if (result != null) {
                              ref
                                  .read(
                                      grupoPesquisaControllerProvider.notifier)
                                  .associarUsuarioGrupoPesquisa(
                                      grupoId, result.cpf);
                              Navigator.of(context).pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Usuário não encontrado'),
                                ),
                              );
                            }
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

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
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 80,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                _showEmailModal(context);
              },
              child: Icon(Icons.person_add),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
