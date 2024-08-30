class GrupoPesquisa {
  final String id;
  final String nome;
  final String sigla;

  final String descricao;
  final DateTime dataCriacao;
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

  // Métodos adicionais, como para atualizar ou adicionar projetos, membros, etc.
}
