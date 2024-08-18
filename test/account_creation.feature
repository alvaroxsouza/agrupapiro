Feature: Accout creation

  Background:
    Given the app is running
      And I Tap {'create account'} text

  Scenario: First user access
    Given I see {'email'} field
      And I see {'senha'} field
      And I see {'usuario'} field
    When I enter {'mail@mail.com'} into {'email'} input field
      And I enter {'password'} into {'senha'} input field
      And I enter {'fulano Di tal'} into {'usuario'} input field
      And I tap {'Criar conta'} button
    Then I see {'email de confirmação enviado'} text

  Scenario: Invalid users email
    Given I see {'email'} field
      And I see {'senha'} field
      And I see {'usuario'} field
    When I enter {'mail_mail.com'} into {'email'} input field
      And I enter {'password'} into {'senha'} input field
      And I enter {'fulano Di tal'} into {'usuario'} input field
      And I tap {'Criar conta'} button
    Then I see {'email inválido'} text
