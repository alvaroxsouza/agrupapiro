Feature: Task Assignment Removal

  Background:
    Given the app is running
    And I am logged in as {'Administrador Geral'} user permission
    And there are tasks with members assigned

  Scenario: Remove Assignment of a Specific Member
    When I select a task named {'Tarefa de Revisão'}
    And I remove the assignment of member {'Carlos'}
    Then I see text {'Atribuição de Carlos removida com sucesso'}
    And the task no longer shows Carlos as assigned

  Scenario: Remove Assignment of Multiple Members
    When I select a task named {'Tarefa de Revisão'}
    And I remove the assignments of members {'Carlos' 'Ana'}
    Then I see text {'Todos os membros foram removidos da tarefa'}
    And the task shows status {'Não Atribuída'}

  Scenario: Failure to Remove the Assignment of a Member
    When the system encounters an error
    Then I see an error message {'Erro ao remover atribuição. Tente novamente mais tarde'}
