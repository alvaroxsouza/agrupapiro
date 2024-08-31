enum Permissoes {
  admin,
  usuario;

  static getPermissaoString(Permissoes permissao) {
    switch (permissao) {
      case Permissoes.admin:
        return 'Administrador';
      case Permissoes.usuario:
        return 'Usuário';
      default:
        return 'Usuário';
    }
  }
}
