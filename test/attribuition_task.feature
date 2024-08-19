Feature: Atribuir tarefas

  Background:
    Given the app is running
      And I am logged in as {'Administrador Geral'}

  Scenario: Atribuir uma tarefa a membros do grupo
    Given I have access to the task list
      And I select a task called {'Tarefa de Revisão'}
      And I choose members {'João', 'Maria'} to assign the task
      And I tap {'Atribuir Tarefa'} button
    Then I see a confirmation message {'Tarefa atribuída com sucesso'}
      And members {'João', 'Maria'} receive notifications about the new task

  Scenario: Falha ao tentar atribuir tarefa a membros sobrecarregados
    Given I have access to the task list
      And I select a task called {'Tarefa de Revisão'}
      And I choose members {'João', 'Ana'} to assign the task
      And João is already overloaded
      And I tap {'Atribuir Tarefa'} button
    Then I see a suggestion {'Ana está sobrecarregada. Considere redistribuir tarefas'}
      And the task assignment is not completed

  Scenario: Falha ao selecionar membros (sem membros selecionados)
    Given I have access to the task list
      And I select a task called {'Tarefa de Revisão'}
      And I do not select any members
      And I tap {'Atribuir Tarefa'} button
    Then I see an error message {'Nenhum membro selecionado para atribuição'}
