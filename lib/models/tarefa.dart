class Tarefa {
  String id;
  String titulo;
  String descricao;
  int dataEntrega;
  int dataCriacao;
  String idGrupoPesquisa;
  String idUsuario;
  String status;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.dataEntrega,
    required this.dataCriacao,
    required this.idGrupoPesquisa,
    required this.idUsuario,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'data_entrega': dataEntrega,
      'data_criacao': dataCriacao,
      'id_grupo_pesquisa': idGrupoPesquisa,
      'id_usuario': idUsuario,
      'status': status,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      dataEntrega: map['data_entrega'],
      dataCriacao: map['data_criacao'],
      idGrupoPesquisa: map['id_grupo_pesquisa'],
      idUsuario: map['id_usuario'],
      status: map['status'],
    );
  }

  factory Tarefa.fromJson(Map<String, dynamic> json) => Tarefa(
        id: json['id'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        dataEntrega: json['data_entrega'],
        dataCriacao: json['data_criacao'],
        idGrupoPesquisa: json['id_grupo_pesquisa'],
        idUsuario: json['id_usuario'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'descricao': descricao,
        'data_entrega': dataEntrega,
        'data_criacao': dataCriacao,
        'id_grupo_pesquisa': idGrupoPesquisa,
        'id_usuario': idUsuario,
        'status': status,
      };
}
