Feature: Task creation

  Background:
    Given the app is running
      And I am logged in as {'Administrador Geral'} user permission
      And I tap first {Widget.card} card

  Scenario: Creating a task
    Given I tap {Icons.add} icon
    When I enter {'Levantar requisitos'} into {'titulo'} input field
      And I enter {'Analisar aplicação e levar os requisitos'} into {'descricao'} input field
      And I enter {'20/09/2024'} into {'prazo'} input field
      And I tap {'média'} text as the priority
      And I tap {'Criar Tarefa'} text
    Then I should see a confirmation message {'Tarefa criada com sucesso'}
      And the task {'Levantar requisitos'} should be visible in the group's task list

  Scenario: Invalid task creation due to past deadline
    Given I tap {Icons.add} icon
    When I enter {'Levantar requisitos'} into {'titulo'} input field
      And I enter {'Analisar aplicação e levar os requisitos'} into {'descricao'} input field
      And I enter {'20/09/1990'} into {'prazo'} input field
      And I tap {'média'} text as the priority
      And I tap {'Criar Tarefa'} text
    Then I see an error message {'Prazo anterior a data atual'}
