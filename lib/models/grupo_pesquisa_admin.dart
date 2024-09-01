class GrupoPesquisaAdmin {
  String cpfUsuario;
  String idGrupoPesquisa;

  GrupoPesquisaAdmin({
    required this.cpfUsuario,
    required this.idGrupoPesquisa,
  });

  Map<String, dynamic> toMap() {
    return {
      'cpfUsuario': cpfUsuario,
      'idGrupoPesquisa': idGrupoPesquisa,
    };
  }

  factory GrupoPesquisaAdmin.fromMap(Map<String, dynamic> map) {
    return GrupoPesquisaAdmin(
      cpfUsuario: map['cpfUsuario'],
      idGrupoPesquisa: map['idGrupoPesquisa'],
    );
  }
}
