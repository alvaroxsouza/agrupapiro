Feature: Atualizar status das tarefas

  Background:
    Given the app is running
      And I am logged in
      And I have the {'Membro Comum'} profile
      And I have tasks assigned to me

  Scenario: Atualizar status de uma tarefa
    Given I have access to the list of assigned tasks
      And I select a task called {'Revisar Documentação'}
      And I update the status to {'Em Progresso'}
      And I tap {'Atualizar Status'} button
    Then I see the updated status {'Em Progresso'}
      And the system notifies the administrator and relevant members

  Scenario: Falha ao atualizar status devido a credenciais inválidas
    Given I am not authenticated
    When I attempt to update the status of a task
    Then I am prompted to log in again

  Scenario: Falha na atualização do status devido a erro de conexão
    Given I have access to the list of assigned tasks
      And I select a task called {'Revisar Documentação'}
      And I update the status to {'Concluída'}
    When the system encounters a connection error
    Then I see an error message {'Erro ao atualizar status. Tente novamente mais tarde'}

  Scenario: Status inválido
    Given I have access to the list of assigned tasks
      And I select a task called {'Revisar Documentação'}
      And I attempt to update the status to {'Incompleto'}
    Then I see an error message {'Status inválido. Selecione um status válido'}
