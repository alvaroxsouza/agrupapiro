enum Status {
  pendente, // Tarefa pendente
  emProgresso, // Tarefa em andamento
  completa, // Tarefa concluída
  cancelado; // Tarefa cancelada

  // Método para obter a string representativa do status
  static String getStatusString(Status status) {
    switch (status) {
      case Status.pendente:
        return 'pendente';
      case Status.emProgresso:
        return 'em progresso';
      case Status.completa:
        return 'completa';
      case Status.cancelado:
        return 'cancelado';
    }
  }

  // Método para obter o Status a partir de uma string
  static Status? fromString(String statusString) {
    switch (statusString.toLowerCase()) {
      case 'pendente':
        return Status.pendente;
      case 'em progresso':
        return Status.emProgresso;
      case 'completa':
        return Status.completa;
      case 'cancelado':
        return Status.cancelado;
      default:
        return null;
    }
  }
}
