import 'package:agrupapiro/data/database.dart';
import 'package:agrupapiro/view/create_tarefa.dart';
import 'package:agrupapiro/view/tarefa_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/view/create_group_page.dart';
import 'package:agrupapiro/view/group_page.dart';
import 'package:agrupapiro/view/home_page.dart';
import 'package:agrupapiro/view/login_page.dart';
import 'package:agrupapiro/view/cadastro_page.dart';
import 'package:agrupapiro/constants/enum/rotas.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (isDesktop()) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    final dbHelper = DatabaseHelper();
    dbHelper.database;
  } else if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactory;
    final dbHelper = DatabaseHelper();
    dbHelper.database;
  }
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

bool isDesktop() {
  // Verifica se está rodando em desktop
  return (defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS);
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
            return MaterialPageRoute(builder: (_) => const CreateGroupPage());
          case Routes.GRUPO:
            return MaterialPageRoute(
              builder: (_) => GroupPage(
                grupoId: '',
                nome: '',
              ),
            );
          case Routes.TAREFA:
            return MaterialPageRoute(
              builder: (_) => const TarefaPage(
                idGrupo: '',
              ),
            );
          case Routes.CRIAR_TAREFA:
            return MaterialPageRoute(
              builder: (_) => CreateTarefa(
                idGrupo: '',
              ),
            );
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
