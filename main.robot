*** Settings ***

Library  SeleniumLibrary

Test Setup  Open Browser  browser=chrome
Test Teardown  Close All Browsers
*** Variables ***
${site}    https://demoqa.com/automation-practice-form
${check_home}    //h1[normalize-space(text())='Practice Form']

*** Keywords ***
Acessar o site
    Go To    url=${site}
    Sleep    5s
    Scroll Element Into View    locator=(//div[@id='dateOfBirth-wrapper']//div)[1]
    Input Text    locator=//input[@placeholder='First Name']    text=Luciano
    Input Text    locator=//input[@placeholder='Last Name']    text=Martins
    

Preencher email
    Input Text    locator=//input[@class='mr-sm-2 form-control']    text=zicadopv@gmail.com

Preencher sexo
    Select Radio Button    group_name=(//div[@class='mt-2 row'])[3]    value=(//input[@name='gender'])[1]

Preencher celular
    Input Text    locator=//input[@placeholder='Mobile Number']    text=(18) 98806-3287
    # Wait Until Element Is Visible    locator

Preencher data
    Click Element    locator=//input[@class='form-control']
    # Input Text    locator=(//label[normalize-space(text())='Date of Birth']/following::input)[1]    text=29 Oct 2025

Prencher pronomes
    Input Text    locator=(//label[normalize-space(text())='Subjects']/following::input)[1]    text=Commerce
    Press Keys    (//label[normalize-space(text())='Subjects']/following::input)[1]    TAB
    Input Text    locator=(//label[normalize-space(text())='Subjects']/following::input)[1]    text=English
    Press Keys    (//label[normalize-space(text())='Subjects']/following::input)[1]    TAB
    Sleep    5s

Fazer upload de imagem
    Choose File    locator=//input[@type='file']    file_path=/home/luxu/Desktop/infoeste_robot_framework/unoeste.png
    Sleep    2s

Checar pagina
    Sleep    2s
    

*** Test Cases ***


Teste 01
    [Documentation]    Esse teste serve para acessar o form
    [Tags]    forms
    Acessar o site
    Wait Until Element Is Visible    locator=${check_home}
    Preencher email
    # Preencher sexo
    Preencher celular
    # Preencher data
    Prencher pronomes
    # Preencher hobbies
    Fazer upload de imagem
    