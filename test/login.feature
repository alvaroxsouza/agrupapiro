Feature: User Login

  Background:
    Given the app is running
      And I have {'Fulano Di Tal'} usuario
      And I have {'password'} senha

  Scenario: Successeful login
    Given I see {'usuario'} input field
      And I see {'senha'} input field
    When I enter {'Fulano Di Tal'} into {'usuario'} input field
      And I enter {'password'} into {'senha'} input field
      And I tap {'Login'} button
    Then I see {'Bem vindo!'} text # Pressupondo que foi redirecionado com o login válido

  Scenario: Invalid user
    Given I see {'usuario'} input field
      And I see {'senha'} input field
    When I enter {'Bletrano'} into {'usuario'} input field
      And I enter {'password'} into {'senha'} input field
      And I tap {'Login'} button
    Then I see {'Usuario ou senha inválido'} text

  Scenario: Invalid password
    Given I see {'usuario'} input field
      And I see {'senha'} input field
    When I enter {'Fulano Di Tal'} into {'usuario'} input field
      And I enter {'pass'} into {'senha'} input field
      And I tap {'Login'} button
    Then I see {'Usuario ou senha inválido'} text

  Scenario: Forgot credentials
    Given I see {'Esqueci minha senha'} text
      And I tap {'Esqueci minha senha'} text
      And I see {'email'} input field
    When I enter {'mail@mail.com'} into input field
      And I tap {'Recuperar senha'} button
    Then I see {'Email para troca de senha foi enviado'} text
