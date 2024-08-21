import 'package:agrupapiro/enum/prioridade.dart';
import 'package:agrupapiro/models/user.dart';
import 'package:flutter/material.dart';

class Activity {
  final String title;
  final String description;
  final User user;
  final Priority prioridade;
  final DateTime deadline;
  final MaterialColor color;

  Activity({
    required this.title,
    required this.description,
    required this.color,
    required this.user,
    required this.prioridade,
    required this.deadline,
  });

  get id => null;

  Activity copyWith({
    String? title,
    String? description,
    MaterialColor? color,
    Priority? prioridade,
    DateTime? deadline,
    User? user,
  }) {
    return Activity(
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
      prioridade: prioridade ?? this.prioridade,
      deadline: deadline ?? this.deadline,
      user: user ?? this.user,
    );
  }
}



