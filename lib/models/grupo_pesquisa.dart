class GrupoPesquisa {
  final String id;
  final String nome;
  final String sigla;

  final String descricao;
  final String dataCriacao;
  final String instituicao;
  final String departamento;

  // Construtor
  GrupoPesquisa({
    required this.id,
    required this.nome,
    required this.sigla,
    required this.descricao,
    required this.dataCriacao,
    required this.instituicao,
    required this.departamento,
  });

  @override
  String toString() {
    return 'GrupoPesquisa{id: $id, nome: $nome, sigla: $sigla, descricao: $descricao, dataCriacao: $dataCriacao, instituicao: $instituicao, departamento: $departamento}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sigla': sigla,
      'descricao': descricao,
      'data_criacao': dataCriacao,
      'instituicao': instituicao,
      'departamento': departamento,
    };
  }

  factory GrupoPesquisa.fromMap(Map<String, dynamic> map) {
    return GrupoPesquisa(
      id: map['id'],
      nome: map['nome'],
      sigla: map['sigla'],
      descricao: map['descricao'],
      dataCriacao: map['data_criacao'],
      instituicao: map['instituicao'],
      departamento: map['departamento'],
    );
  }

  factory GrupoPesquisa.fromJson(Map<String, dynamic> json) => GrupoPesquisa(
        id: json['id'],
        nome: json['nome'],
        sigla: json['sigla'],
        descricao: json['descricao'],
        dataCriacao: json['data_criacao'],
        instituicao: json['instituicao'],
        departamento: json['departamento'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'sigla': sigla,
        'descricao': descricao,
        'data_criacao': dataCriacao,
        'instituicao': instituicao,
        'departamento': departamento,
      };
}
