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
