class UsuarioGrupoPesquisa {
  String cpfUsuario;
  String idGrupoPesquisa;

  UsuarioGrupoPesquisa({
    required this.cpfUsuario,
    required this.idGrupoPesquisa,
  });

  Map<String, dynamic> toMap() {
    return {
      'cpfUsuario': cpfUsuario,
      'idGrupoPesquisa': idGrupoPesquisa,
    };
  }

  factory UsuarioGrupoPesquisa.fromMap(Map<String, dynamic> map) {
    return UsuarioGrupoPesquisa(
      cpfUsuario: map['cpfUsuario'],
      idGrupoPesquisa: map['idGrupoPesquisa'],
    );
  }
}
