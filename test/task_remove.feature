Feature: Remove Task

  Background:
    Given the app is running
    And I am logged in as {'Administrador Geral'} user permission
    And there are tasks created in the system

  Scenario: Successfully Removing an Existing Task
    When I select a task named {'Tarefa Obsoleta'}
    And I tap {'Remover Tarefa'} button
    Then I see a confirmation message {'Tarefa removida com sucesso'}
    And the task no longer appears in the task lists of the members

  Scenario: Failure to Remove a Task Due to System Error
    When the system encounters an error
    Then I see an error message {'Erro ao remover a tarefa. Tente novamente mais tarde'}
