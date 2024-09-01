import 'package:agrupapiro/controllers/grupo_pesquisa_controller.dart';
import 'package:agrupapiro/models/grupo_pesquisa.dart';
import 'package:agrupapiro/services/sessao_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class CreateGroupPage extends ConsumerStatefulWidget {
  const CreateGroupPage({super.key});

  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends ConsumerState<CreateGroupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController siglaController = TextEditingController();
  final TextEditingController instituicaoController = TextEditingController();
  final TextEditingController departamentoController = TextEditingController();

  Future<void> _criarGrupo() async {
    if (_formKey.currentState?.validate() ?? false) {
      var uuid = Uuid();
      final grupoPesquisa = GrupoPesquisa(
        id: uuid.v4(),
        nome: nomeController.text,
        sigla: siglaController.text,
        descricao: descricaoController.text,
        dataCriacao: DateTime.now().toString(),
        instituicao: instituicaoController.text,
        departamento: departamentoController.text,
      );

      try {
        // Aguarda a resolução do Future para obter o token do usuário
        String? tokenUsuario =
            await ref.read(sessaoServiceProvider).getUserToken();

        if (context.mounted) {
          final resultInsertGrupoPesquisa = await ref
              .read(grupoPesquisaControllerProvider.notifier)
              .insertGrupoPesquisa(grupoPesquisa);

          String idAdmin = '';
          if (tokenUsuario != null) {
            idAdmin = tokenUsuario;
          }

          if (idAdmin.isNotEmpty) {
            final resultInsertGrupoPesquisaUsuarioAdmin = await ref
                .read(grupoPesquisaControllerProvider.notifier)
                .insertGrupoPesquisaUsuarioAdmin(
                  grupoPesquisa.id,
                  idAdmin,
                );
            if (resultInsertGrupoPesquisa > 0 &&
                resultInsertGrupoPesquisaUsuarioAdmin > 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Grupo de Pesquisa cadastrado com sucesso!'),
                ),
              );
              // Navegue para outra página ou limpe o formulário
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Falha ao cadastrar o grupo de pesquisa'),
                ),
              );
            }
          }
        }
      } catch (e) {
        print("Erro: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro: $e'),
          ),
        );
      }
      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(grupoPesquisaControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Novo Grupo'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome do Grupo',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: siglaController,
                  decoration: InputDecoration(
                    labelText: 'Sigla',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: descricaoController,
                  decoration: InputDecoration(
                    labelText: 'Descrição do Grupo',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: instituicaoController,
                  decoration: InputDecoration(
                    labelText: 'Instituição',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: departamentoController,
                  decoration: InputDecoration(
                    labelText: 'Departamento',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _criarGrupo,
                      child: Text('Criar Grupo'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
