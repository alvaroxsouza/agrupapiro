Feature: Account Creation

  Background:
    Given the app is running
    And I am on the {'Criar conta'} page

  Scenario: Successful Account Creation
    When I enter {'mail@mail.com'} into {'email'} input field
    And I enter {'password'} into {'senha'} input field
    And I enter {'fulano Di tal'} into {'usuario'} input field
    And I tap {'Criar conta'} button
    Then I see a success message {'Email de confirmação enviado'}
    And a confirmation email should be sent to {'mail@mail.com'}

  Scenario: Invalid Email Format
    When I enter {'mail_mail.com'} into {'email'} input field
    And I enter {'password'} into {'senha'} input field
    And I enter {'fulano Di tal'} into {'usuario'} input field
    And I tap {'Criar conta'} button
    Then I see an error message {'Email inválido'}
