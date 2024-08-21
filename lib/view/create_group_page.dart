import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateGroupPage extends ConsumerWidget {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupDescriptionController = TextEditingController();
  final TextEditingController _memberEmailController = TextEditingController();
  final List<String> _members = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Novo Grupo'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(
                labelText: 'Nome do Grupo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _groupDescriptionController,
              decoration: InputDecoration(
                labelText: 'Descrição do Grupo',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _memberEmailController,
              decoration: InputDecoration(
                labelText: 'Adicionar Membro (E-mail)',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  _members.add(value);
                  _memberEmailController.clear();
                }
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _members.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_members[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _members.removeAt(index);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para criar o grupo e salvar no banco de dados
                  // lógica para designar automaticamente o criador como Administrador Geral
                  // Redirecionar ou  confirmação após criar o grupo
                },
                child: Text('Criar Grupo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
