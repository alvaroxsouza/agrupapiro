import 'package:agrupapiro/controllers/tarefa_controller.dart';
import 'package:agrupapiro/models/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class EditTarefa extends ConsumerStatefulWidget {
  final Tarefa tarefa;

  const EditTarefa({super.key, required this.tarefa});

  @override
  ConsumerState<EditTarefa> createState() => _EditTarefaState();
}

class _EditTarefaState extends ConsumerState<EditTarefa> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController tituloController;
  late TextEditingController descricaoController;
  late TextEditingController dataEntregaController;
  late TextEditingController dataCriacaoController;
  String? statusSelecionado;

  final List<String> statusOptions = ['FEITO', 'NÃO FEITO', 'EM EXECUÇÃO'];

  @override
  void initState() {
    super.initState();
    tituloController = TextEditingController(text: widget.tarefa.titulo);
    descricaoController = TextEditingController(text: widget.tarefa.descricao);
    dataEntregaController =
        TextEditingController(text: widget.tarefa.dataEntrega);
    dataCriacaoController =
        TextEditingController(text: widget.tarefa.dataCriacao);
    statusSelecionado = widget.tarefa.status;
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

  Future<void> _atualizarTarefa() async {
    if (_formKey.currentState?.validate() ?? false) {
      final tarefaAtualizada = widget.tarefa.copyWith(
        titulo: tituloController.text,
        descricao: descricaoController.text,
        dataEntrega: dataEntregaController.text,
        status: statusSelecionado ?? 'NÃO FEITO',
      );

      try {
        final result = await ref
            .read(tarefaControllerProvider.notifier)
            .updateTarefa(tarefaAtualizada);

        if (!mounted) return;

        if (result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tarefa atualizada com sucesso!'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erro ao atualizar tarefa!'),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao atualizar tarefa!'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Tarefa'),
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
            _atualizarTarefa();
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
