Feature: Task management

  Background:
    Given the app is running
      And I am logged in
      And I tap first {Widget.card} card
      And I have the {'Administrador geral'} profile

  Scenario: Creating a task
    Given I tap {Icons.add} icon
    When I enter {'Levantar requisitos'} into {'titulo'} input field
      And I enter {'Analisar aplicação e levar os requisitos'} into {'descricao'} input field
      And I enter {'20/09/2024'} into {'prazo'} input field
      And I tap {'média'} text
      And I tap {'Criar Tarefa'} text
    Then I see {'Levantar requisitos'} text

  Scenario: Invalid  task
    Given I tap {Icons.add} icon
    When I enter {'Levantar requisitos'} into {'titulo'} input field
      And I enter {'Analisar aplicação e levar os requisitos'} into {'descricao'} input field
      And I enter {'20/09/1990'} into {'prazo'} input field
      And I tap {'média'} text
      And I tap {'Criar Tarefa'} text
    Then I see {'Prazo anterior a data atual'} text
