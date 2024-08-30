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
            UserAccountsDrawerHeader(
              accountName: Text("usuario"), accountEmail: Text("enmail@gmail.com")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Inicio"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Sair"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
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
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
            ],
          ),
        ),
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

