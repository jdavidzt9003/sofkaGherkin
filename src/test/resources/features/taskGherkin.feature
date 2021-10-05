# Author Jesús David Zaraza Toro

Feature: como cliente del banco
  quiero solicitar un credito hipotecario por el portal web
  para conocer la respuesta en linea

  Scenario: solicitud de credito hipotecario en el portal web
    Given el usuario ingresa al portal web personas del banco
    When diligencia el formulario de registro
    Then el portal web le arroja el mensaje de solicitud exitosa