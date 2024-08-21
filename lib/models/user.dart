import 'package:agrupapiro/enum/permissoes.dart';

class User {
  final String name;
  final String id;
  final String email;
  final String password;
  final Permissoes permissao; 

  User({
    required this.name,
    required this.id,
    required this.email,
    required this.password,
    required this.permissao,  
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      permissao: Permissoes.values.firstWhere(
        (e) => e.toString() == 'Permissoes.${json['permissao']}',
        orElse: () => Permissoes.usuario,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'password': password,
      'permissao': permissao.toString().split('.').last,  
    };
  }
}


