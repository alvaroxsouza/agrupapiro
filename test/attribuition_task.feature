Feature: Task assignment

  Background:
    Given the app is running
      And I am logged in as {'Administrador Geral'} user permission

  Scenario: Assign a task to group members
    Given I have access to the task list
      And I select a task named {'Tarefa de Revisão'}
      And I choose members {'João', 'Maria'} to assign the task
      And I tap {'Atribuir Tarefa'} button
    Then I see a confirmation message {'Tarefa atribuída com sucesso'}
      And members {'João', 'Maria'} receive notifications about the new task

  Scenario: Failure to assign a task to overloaded members
    Given I have access to the task list
      And I select a task named {'Tarefa de Revisão'}
      And I choose members {'João', 'Ana'} to assign the task
      And João is already overloaded
      And I tap {'Atribuir Tarefa'} button
    Then I see a suggestion {'João está sobrecarregada. Considere redistribuir tarefas'}
      And the task assignment should not be completed

  Scenario: Failure to asiggn a task when there isn't members selected
    Given I have access to the task list
      And I select a task named {'Tarefa de Revisão'}
      And I do not select any members
      And I tap {'Atribuir Tarefa'} button
    Then I see an error message {'Nenhum membro selecionado para atribuição'}
