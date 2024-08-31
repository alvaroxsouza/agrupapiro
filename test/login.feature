Feature: User Login

  Background:
    Given the app is running
    And the user {'Fulano Di Tal'} is registered with password {'password'}

  Scenario: Successful Login
    When I enter {'Fulano Di Tal'} into {'usuario'} input field
    And I enter {'password'} into {'senha'} input field
    And I tap {'Login'} button
    Then I see text {'Bem vindo!'}
    And I should be redirected to the application's homepage

  Scenario: Invalid Username
    When I enter {'Beltrano'} into {'usuario'} input field
    And I enter {'password'} into {'senha'} input field
    And I tap {'Login'} button
    Then I see text {'Usuario ou senha inválido'}

  Scenario: Invalid Password
    When I enter {'Fulano Di Tal'} into {'usuario'} input field
    And I enter {'pass'} into {'senha'} input field
    And I tap {'Login'} button
    Then I see text {'Usuario ou senha inválido'}

  Scenario: Forgot Password
    When I tap {'Esqueci minha senha'} text
    And I see {'email'} input field
    And I enter {'mail@mail.com'} into {'email'} input field
    And I tap {'Recuperar senha'} button
    Then I see {'Email para troca de senha foi enviado'} text
