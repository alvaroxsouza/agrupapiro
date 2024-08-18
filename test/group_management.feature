Feature: Group management

  Background:
    Given the app is running
      And I am logged in

  Scenario: Creating a group
    Given I have the {'Administrador geral'} profile
      And I tap {Icons.add} icon
    When I enter {'EnhenhariaSoftwareII'} into {'nome do grupo'} input field
      And I enter {'Grupo de organziacao de tarefas es2'} into {'descricao'} input field
      And I tap {'Criar grupo'} button
    Then I see {'EnhenhariaSoftwareII'} text

  Scenario: Creating a existing grupo name
    Given I have the {'Administrador geral'} profile
      And I tap {Icons.add} icon
    When I enter {'EnhenhariaSoftwareII'} into {'nome do grupo'} input field
      And I enter {'tarefas es2'} into {'descricao'} input field
      And I tap {'Criar grupo'} button
    Then I see {'Um grupo com esse mesmo nome já existe'} text
