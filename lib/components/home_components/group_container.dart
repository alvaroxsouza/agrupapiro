import 'package:agrupapiro/constants/enum/rotas.dart';
import 'package:agrupapiro/view/group_page.dart';
import 'package:flutter/material.dart';

class GroupContainer extends StatelessWidget {
  final String id;
  final String nome;
  final String sigla;
  final String descricao;
  final String dataCriacao;
  final String instituicao;
  final String departamento;

  const GroupContainer({
    Key? key,
    required this.id,
    required this.nome,
    required this.sigla,
    required this.descricao,
    required this.dataCriacao,
    required this.instituicao,
    required this.departamento,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GroupPage(
              grupoId: id,
              nome: nome,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: const NetworkImage(
                'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png',
              ),
              backgroundColor: Colors.orange,
              child: Text(this.sigla),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.nome,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  this.descricao,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
