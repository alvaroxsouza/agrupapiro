import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/view/create_group_page.dart';
import 'package:agrupapiro/view/activity_page.dart';
import 'package:agrupapiro/view/group_page.dart';
import 'package:agrupapiro/view/home_page.dart';
import 'package:agrupapiro/view/login_page.dart';
import 'package:agrupapiro/view/cadastro_page.dart';
import 'package:agrupapiro/enum/rotas.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agrupapiro',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.LOGIN,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.HOME:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case Routes.LOGIN:
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case Routes.CADASTRO:
            return MaterialPageRoute(builder: (_) => const CadastroPage());
          case Routes.CRIAR:
            return MaterialPageRoute(builder: (_) => CreateGroupPage());
          case Routes.GRUPO:
            return MaterialPageRoute(builder: (_) => GroupPage());
          case Routes.ATIVIDADES:
            return MaterialPageRoute(builder: (_) => const ActivityPage());
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                appBar: AppBar(
                  title: const Text('Erro'),
                ),
                body: const Center(
                  child: Text('Página não encontrada'),
                ),
              ),
            );
        }
      },
    );
  }
}
