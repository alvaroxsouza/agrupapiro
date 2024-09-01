class GrupoPesquisaTarefa {
  String idGrupoPesquisa;
  String idTarefa;

  GrupoPesquisaTarefa({
    required this.idGrupoPesquisa,
    required this.idTarefa,
  });

  Map<String, dynamic> toMap() {
    return {
      'idGrupoPesquisa': idGrupoPesquisa,
      'idTarefa': idTarefa,
    };
  }

  factory GrupoPesquisaTarefa.fromMap(Map<String, dynamic> map) {
    return GrupoPesquisaTarefa(
      idGrupoPesquisa: map['idGrupoPesquisa'],
      idTarefa: map['idTarefa'],
    );
  }
}
