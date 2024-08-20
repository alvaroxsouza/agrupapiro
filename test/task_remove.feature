Feature: Remove task

  Background:
    Given the app is running
      And I am logged in as {'Administrador Geral'} user permission
      And there are tasks created in th system

  Scenario: Successfully removing an existing task
    Given I have access to the task list
      And I select a task named {'Tarefa Obsoleta'}
      And I tap {'Remover Tarefa'} button
    Then I see a confirmation message {'Tarefa removida com sucesso'}
      And the task no longer appears in the task lists of the members

  Scenario: Failure to remove a task due to system error
    Given I have access to the task list
      And I select a task named {'Tarefa Obsoleta'}
      And I tap {'Remover Tarefa'} button
    When the system encounters an error
    Then I see an error message {'Erro ao remover a tarefa. Tente novamente mais tarde'}
