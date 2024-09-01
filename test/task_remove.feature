Feature: Task Creation

  Background:
    Given the app is running
    And I am logged in as {'Administrador Geral'} user permission

  Scenario: Creating a Task
    When I tap {Icons.add} icon
    And I enter {'Levantar requisitos'} into {'titulo'} input field
    And I enter {'Analisar aplicação e levar os requisitos'} into {'descrição'} input field
    And I enter {'20/09/2024'} into {'prazo'} input field
    And I tap {'média'} text as the priority
    And I tap {'Criar Tarefa'} text
    Then I should see a confirmation message {'Tarefa criada com sucesso'}
    And the task {'Levantar requisitos'} should be visible in the group's task list

  Scenario: Invalid Task Creation Due to Past Deadline
    When I tap {Icons.add} icon
    And I enter {'Levantar requisitos'} into {'titulo'} input field
    And I enter {'Analisar aplicação e levar os requisitos'} into {'descrição'} input field
    And I enter {'20/09/1990'} into {'prazo'} input field
    And I tap {'média'} text as the priority
    And I tap {'Criar Tarefa'} text
    Then I see an error message {'Prazo anterior a data atual'}
