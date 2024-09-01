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
