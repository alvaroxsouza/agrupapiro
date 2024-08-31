Feature: Group Creation

  Background:
    Given the app is running
    And I am logged in as {'Administrador Geral'}

  Scenario: Successfully Creating a New Group
    When I enter {'EngenhariaSoftwareII'} into {'nome do grupo'} input field
    And I enter {'Grupo de organização de tarefas EngenhariaSoftwareII'} into {'descrição'} input field
    And I tap {'Criar grupo'} button
    Then I see a success message {'Grupo criado com sucesso'}
    And the group {'EngenhariaSoftwareII'} should be visible in my groups

  Scenario: Creating a Group with an Existing Name
    When I enter {'EngenhariaSoftwareII'} into {'nome do grupo'} input field
    And I enter {'Tarefas ES2'} into {'descrição'} input field
    And I tap the {'Criar grupo'} button
    Then I see an error message {'Um grupo com esse mesmo nome já existe'}
