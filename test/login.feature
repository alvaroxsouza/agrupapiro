Feature: User Login

  Background:
    Given the app is running
      And I have {'Fulano Di Tal'} username
      And I have {'password'} password

  Scenario: Successeful login
    Given I see {'usuario'} input field
      And I see {'senha'} input field
    When I enter {'Fulano Di Tal'} into {'usuario'} input field
      And I enter {'password'} into {'senha'} input field
      And I tap {'Login'} button
    Then I see {'Bem vindo!'} text 
      And I should be redirected to the aplication's homepage

  Scenario: Invalid username
    Given I see {'usuario'} input field
      And I see {'senha'} input field
    When I enter {'Beltrano'} into {'usuario'} input field
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

  Scenario: Forgot password
    Given I see {'Esqueci minha senha'} text
      And I tap {'Esqueci minha senha'} text
      And I see {'email'} input field
    When I enter {'mail@mail.com'} into input field
      And I tap {'Recuperar senha'} button
    Then I see {'Email para troca de senha foi enviado'} text
