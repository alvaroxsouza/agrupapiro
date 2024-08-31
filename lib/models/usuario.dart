class UsuarioSistema {
  String cpf;
  String nome;
  String email;
  String senha;
  String universidade;
  String curso;
  String periodo;
  String telefone;

  UsuarioSistema({
    required this.cpf,
    required this.nome,
    required this.email,
    required this.senha,
    required this.universidade,
    required this.curso,
    required this.periodo,
    required this.telefone,
  });

  factory UsuarioSistema.fromJson(Map<String, dynamic> json) {
    return UsuarioSistema(
      cpf: json['cpf'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
      universidade: json['universidade'],
      curso: json['curso'],
      periodo: json['periodo'],
      telefone: json['telefone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cpf': cpf,
      'nome': nome,
      'email': email,
      'senha': senha,
      'universidade': universidade,
      'curso': curso,
      'periodo': periodo,
      'telefone': telefone,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return UsuarioSistema(
      cpf: map['cpf'],
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
      universidade: map['universidade'],
      curso: map['curso'],
      periodo: map['periodo'],
      telefone: map['telefone'],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'cpf': cpf,
      'nome': nome,
      'email': email,
      'senha': senha,
      'universidade': universidade,
      'curso': curso,
      'periodo': periodo,
      'telefone': telefone,
    };
  }
}
