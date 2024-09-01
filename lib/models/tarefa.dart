class Tarefa {
  String id;
  String titulo;
  String descricao;
  String dataEntrega;
  String dataCriacao;
  String idGrupo;
  String idUsuario;
  String status;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.dataEntrega,
    required this.dataCriacao,
    required this.idGrupo,
    required this.status,
    this.idUsuario = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'data_entrega': dataEntrega,
      'data_criacao': dataCriacao,
      'id_grupo': idGrupo,
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
      idGrupo: map['id_grupo'],
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
        status: json['status'],
        idGrupo: json['id_grupo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'descricao': descricao,
        'data_entrega': dataEntrega,
        'data_criacao': dataCriacao,
        'id_grupo': idGrupo,
        'id_usuario': idUsuario,
        'status': status,
      };
}
