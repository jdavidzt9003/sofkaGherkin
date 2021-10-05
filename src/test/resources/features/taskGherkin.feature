# Author Jesús David Zaraza Toro

Feature: como cliente del banco
  quiero solicitar un credito hipotecario por el portal web
  para conocer la respuesta en linea

  Scenario: solicitud de credito hipotecario en el portal web
    Given el usuario ingresa al portal web personas del banco
    When diligencia el formulario de registro
    Then el portal web le arroja el mensaje de solicitud exitosa

  Scenario Outline: Solicitud de credito hipotecario para un usuario negativo
    Given el usuario ingresa al portal web personas del banco con <user>, <password> y <token>
    When  diligencia el formulario de registro
    Then el portal arroja un mensaje alerta indicando usuario con reporte negativo

    Examples:
      | user         | password | token  |
      | jesus.zaraza | Abc123*  | 569835 |


#Author: daniel.sanchezs@sofka.com.co
# Fecha: 05/10/2021

Feature: Como persona natural quiero simular una inversion virtual con
  Bancolombia
#Url de guia:https://www.grupobancolombia.com/personas/productos-servicios/inversiones/cdts/inversion-virtual/simulador-inversion-virtual
#La idea es simular una inversion virtual bajo ciertos parametros
# El monto debe de ser >= 500000,
# El monto debe de ser <= 10000000
# --------------------------------
# Los dias deben de ser >=30,
# Los dias deben de ser <=899

  Scenario Outline: Persona Natural solicita inversion de manera exitosa

    Given Estoy en la pagina de bancolombia
    When ingreso <Monto>
    And doy click en "Si"
    And ingreso <Dias>
    And doy click en "Mensualmente"
    And doy click en "Simular"
    Then se habilita la opcion "Solicitar inversion"

    Examples:
      | Monto      | Dias  | Caso de Prueba                    |
      | "500000"   | "30"  | "1 Monto y dias minimo permitido" |
      | "10000000" | "899" | "2 Monto y dias maximo permitido" |


  Scenario Outline: Persona Natural solicita inversion de manera Fallida

    Given Estoy en la pagina de bancolombia
    When ingreso <Monto>
    And doy click en "Si"
    And ingreso <Dias>
    Then No se habilita la opcion "Simular"

    Examples:
      | Monto      | Dias  | Caso de Prueba         |
      | "500000"   | "900" | "3 Dias no permitido"  |
      | "20000000" | "899" | "4 Monto no permitido" |