import 'package:agrupapiro/controllers/tarefa_controller.dart';
import 'package:agrupapiro/models/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CreateTarefa extends ConsumerStatefulWidget {
  final String idGrupo;

  const CreateTarefa({super.key, required this.idGrupo});

  @override
  ConsumerState<CreateTarefa> createState() => _CreateTarefaState();
}

class _CreateTarefaState extends ConsumerState<CreateTarefa> {
  final _formKey = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final dataEntregaController = TextEditingController();
  final dataCriacaoController = TextEditingController();
  final idGrupoPesquisaController = TextEditingController();
  final idUsuarioController = TextEditingController();
  String? statusSelecionado;

  final List<String> statusOptions = ['FEITO', 'NÃO FEITO', 'EM EXECUÇÃO'];

  @override
  void initState() {
    super.initState();
    // Define a data de criação como "agora"
    dataCriacaoController.text =
        DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  // Método para exibir o DatePicker e armazenar a data no formato String
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _cadastrar_tarefa() async {
    if (_formKey.currentState?.validate() ?? false) {
      var uuid = Uuid();
      final tarefa = Tarefa(
        id: uuid.v4(),
        titulo: tituloController.text,
        descricao: descricaoController.text,
        dataEntrega: dataEntregaController.text,
        dataCriacao: dataCriacaoController.text,
        status: statusSelecionado ?? 'NÃO FEITO',
      );

      try {
        final result =
            await ref.read(tarefaControllerProvider.notifier).addTarefa(tarefa);

        final resultAssociarTarefaGrupo = await ref
            .read(tarefaControllerProvider.notifier)
            .associarTarefaGrupo(tarefa.id, widget.idGrupo);

        if (!mounted) return;

        if (result > 0 && resultAssociarTarefaGrupo > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tarefa cadastrada com sucesso!'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erro ao cadastrar tarefa!'),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao cadastrar tarefa!'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: 'Título'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            TextFormField(
              controller: dataEntregaController,
              readOnly: true, // Impede a edição manual
              decoration: const InputDecoration(labelText: 'Data de Entrega'),
              onTap: () => _selectDate(context, dataEntregaController),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            TextFormField(
              controller: dataCriacaoController,
              readOnly: true, // Impede a edição manual
              decoration: const InputDecoration(
                labelText: 'Data de Criação',
                enabled: false, // Campo não editável
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Status'),
              value: statusSelecionado,
              items: statusOptions.map((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  statusSelecionado = newValue;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _cadastrar_tarefa();
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
