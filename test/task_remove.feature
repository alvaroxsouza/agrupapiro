Feature: Remover tarefas

  Background:
    Given the app is running
      And I am logged in
      And I have the {'Administrador Geral'} profile
      And I have tasks created

  Scenario: Remover uma tarefa existente
    Given I have access to the task list
      And I select a task called {'Tarefa Obsoleta'}
      And I tap {'Remover Tarefa'} button
    Then I see a confirmation message {'Tarefa removida com sucesso'}
      And the task no longer appears in the task lists of the members

  Scenario: Falha na remoção da tarefa
    Given I have access to the task list
      And I select a task called {'Tarefa Obsoleta'}
      And I tap {'Remover Tarefa'} button
    When the system encounters an error
    Then I see an error message {'Erro ao remover a tarefa. Tente novamente mais tarde'}
