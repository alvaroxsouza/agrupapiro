Feature: Atualizar Status das Tarefas

  Background:
    Given the app is running
    And I am logged in as {'Membro Comum'} user permission
    And I have tasks assigned to me

  Scenario: Successfully Updating the Status of a Task
    When I select a task called {'Revisar Documentação'}
    And I update the status to {'Em Progresso'}
    And I tap {'Atualizar Status'} button
    Then I see the updated status {'Em Progresso'}
    And the system notifies the administrator and relevant members

  Scenario: Failure to Update Status Due to Invalid Credentials
    Given I am not authenticated because the session expired
    When I attempt to update the status of a task
    Then I am prompted to log in again

  Scenario: Failure to Update Status Due to a Connection Error
    When the system encounters a connection error
    Then I see an error message {'Erro ao atualizar status. Tente novamente mais tarde'}

  Scenario: Invalid Status Selection
    When I attempt to update the status to {'Incompleto'}
    Then I see an error message {'Status inválido. Selecione um status válido'}
