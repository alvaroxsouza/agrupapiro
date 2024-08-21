Feature: Task assignment removal

  Background:
    Given the app is running
      And I am logged in as {'Administrador Geral'} user permission
      And there are tasks with members assigned

  Scenario: Remove assignment of a specific member
    Given I have access to the task list
      And I select a task named {'Tarefa de Revisão'}
      And I choose to remove the assignment of member {'Carlos'}
      And I tap {'Remover Atribuição'} button
    Then I see a message indicating removal of the member {'Atribuição de Carlos removida com sucesso'}
      And the task no longer shows Carlos as assigned

  Scenario: Remove assignment of multiple members
    Given I have access to the task list
      And I select a task named {'Tarefa de Revisão'}
      And I choose to remove the assignments of members {'Carlos', 'Ana'}
      And I tap {'Remover Atribuição'} button
    Then I see a success message {'Todos os membros foram removidos da tarefa'}
      And the task shows status {'Não Atribuída'}

  Scenario: Failure to remove the assignment of a member
    Given I have access to the task list
      And I select a task named {'Tarefa de Revisão'}
      And I choose to remove the assignment of member {'Carlos'}
      And I tap {'Remover Atribuição'} button
    When the system encounters an error
    Then I see an error message {'Erro ao remover atribuição. Tente novamente mais tarde'}
