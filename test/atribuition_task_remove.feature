Feature: Remover atribuição de tarefas

  Background:
    Given the app is running
      And I am logged in
      And I have the {'Administrador Geral'} profile
      And tasks with members assigned exist

  Scenario: Remover a atribuição de um membro específico
    Given I have access to the task list
      And I select a task called {'Tarefa de Revisão'}
      And I choose to remove the assignment of member {'Carlos'}
      And I tap {'Remover Atribuição'} button
    Then I see a message indicating removal of the member {'Atribuição de Carlos removida com sucesso'}
      And the task no longer shows Carlos as assigned

  Scenario: Remover a atribuição de múltiplos membros
    Given I have access to the task list
      And I select a task called {'Tarefa de Revisão'}
      And I choose to remove the assignments of members {'Carlos', 'Ana'}
      And I tap {'Remover Atribuição'} button
    Then I see a message indicating all members were removed {'Todos os membros foram removidos da tarefa'}
      And the task shows status {'Não Atribuída'}

  Scenario: Falha ao remover a atribuição de um membro
    Given I have access to the task list
      And I select a task called {'Tarefa de Revisão'}
      And I choose to remove the assignment of member {'Carlos'}
      And I tap {'Remover Atribuição'} button
    When the system encounters an error
    Then I see an error message {'Erro ao remover atribuição. Tente novamente mais tarde'}
