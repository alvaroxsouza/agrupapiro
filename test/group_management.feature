Feature: Group creation

  Background:
    Given the app is running
      And I am logged in as an {'Adminstrador geral'}

  Scenario: Successfully creating a new group
    Given I am on the {'Criação de grupo'} page
    When I enter {'EngenhariaSoftwareII'} into {'nome do grupo'} input field
      And I enter {'Grupo de organização de tarefas EngenhariaSoftwareII'} into {'descrição'} input field
      And I tap {'Criar grupo'} button
    Then I see a success message {'Grupo criado com sucesso'}
      And the group {'EngenhariaSoftwareII'} should be visible in my groups

  Scenario: Creating a group with an existing name
    Given I am on the {'Criação de grupo'} page
    When I enter {'EngenhariaSoftwareII'} into {'nome do grupo'} input field
      And I enter {'Tarefas ES2'} into {'descricao'} input field
      And I tap the {'Criar grupo'} button
    Then I see an error message {'Um grupo com esse mesmo nome já existe'}
    
