import 'package:agrupapiro/enum/prioridade.dart';
import 'package:agrupapiro/enum/status_activity.dart'; // Nova importação para status
import 'package:agrupapiro/models/user.dart';
import 'package:flutter/material.dart';

class Activity {
  final int id;
  final String title;
  final String description;
  final User user;
  final Priority prioridade;
  final DateTime deadline;
  final MaterialColor color;
  final Status status; // Novo campo para status da tarefa
  final User? assignedMember; // Novo campo para membro atribuído

  Activity({

    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.user,
    required this.prioridade,
    required this.deadline,
    this.status = Status.pendente, // Define um status padrão
    this.assignedMember,
  });

 // get id => null;

   Activity copyWith({
    int? id, // Adicionando o id ao método copyWith
    String? title,
    String? description,
    MaterialColor? color,
    Priority? prioridade,
    DateTime? deadline,
    User? user,
    Status? status,
    User? assignedMember,
  }) {
    return Activity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
      prioridade: prioridade ?? this.prioridade,
      deadline: deadline ?? this.deadline,
      user: user ?? this.user,
      status: status ?? this.status,
      assignedMember: assignedMember ?? this.assignedMember,
    );
  }

  // Método para atribuir tarefa a um membro
  Activity assignTask(User member) {
    return copyWith(assignedMember: member);
  }

  // Método para remover atribuição de tarefa
  Activity removeAssignment() {
    return copyWith(assignedMember: null);
  }

  // Método para atualizar o status da tarefa
  Activity updateStatus(Status newStatus) {
    return copyWith(status: newStatus);
  }
}
