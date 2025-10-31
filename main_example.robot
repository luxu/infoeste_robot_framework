*** Settings ***
Library  SeleniumLibrary
Library    Dialogs


# Test Setup  Open Browser  browser=chrome options=${CHROME_OPTIONS}
Test Setup  Abrir navegador
Test Teardown  Close All Browsers

*** Variables ***

${site}    https://demoqa.com/automation-practice-form
${check_home}    //h1[normalize-space(text())='Practice Form']


*** Keywords ***
Abrir navegador
    Open Browser    ${site}   chrome
    Maximize Browser Window

Remover anuncios
    Execute JavaScript    
    ...    document.querySelectorAll('iframe, [id*="google_ads"], [id*="Ad.Plus"]').forEach(e => e.remove());
    Sleep    1s

Acessar o site
    # Go To    url=${site}
    Scroll Element Into View    locator=(//div[@id='dateOfBirth-wrapper']//div)[1]
    
Preencher nome
    Wait Until Element Is Visible    locator=${check_home}
    Input Text    locator=//input[@placeholder='First Name']    text=Luciano
    Input Text    locator=//input[@placeholder='Last Name']    text=Martins

Preencher email
    Input Text    locator=//input[@class='mr-sm-2 form-control']    text=zicadopv@gmail.com

    
Preencher sexo
    # Tenta clicar no label
    ${result}=    Run Keyword And Ignore Error    Click Element    xpath=//label[@for='gender-radio-1']
    # Se ainda assim falhar, força com JS
    Run Keyword If    '${result[0]}'=='FAIL'    Execute JavaScript    document.getElementById('gender-radio-1').click();

Preencher celular
    Input Text    locator=//input[@placeholder='Mobile Number']    text=18988063287
    # Wait Until Element Is Visible    locator

Preencher pronomes
    Input Text    locator=(//label[normalize-space(text())='Subjects']/following::input)[1]    text=Commerce
    Press Keys    (//label[normalize-space(text())='Subjects']/following::input)[1]    TAB
    Input Text    locator=(//label[normalize-space(text())='Subjects']/following::input)[1]    text=English
    Press Keys    (//label[normalize-space(text())='Subjects']/following::input)[1]    TAB

Fazer upload de imagem
    # Windows
    # Choose File    locator=//input[@type='file']    file_path=E:/infoeste_robot_framework/unoeste.png    
    # Linux
    Choose File    locator=//input[@type='file']    file_path=/home/luxu/Desktop/infoeste_robot_framework/unoeste.png

Preencher data
    [Arguments]    ${day}    ${month}    ${year}
    Execute JavaScript    document.getElementById('dateOfBirthInput').click();
    # Seleciona mês (por texto)
    Select From List By Label
    ...    xpath=//select[contains(@class,"react-datepicker__month-select")]
    ...    ${month}
    # Seleciona ano (por valor)
    Select From List By Value
    ...    xpath=//select[contains(@class,"react-datepicker__year-select")]
    ...    ${year}
    # Seleciona o dia
    Click Element
    ...    xpath=//div[contains(@class,'react-datepicker__day') and text()='${day}']

Preencher hobbies
    Click Element    xpath=//label[@for='hobbies-checkbox-1']
    Click Element    xpath=//label[@for='hobbies-checkbox-3']

Preencher endereco
    Input Text    locator=//textarea[@placeholder='Current Address']    text=Rua dos bobos, 0
    Wait Until Element Is Enabled    xpath=//div[@id='state']    timeout=10s


Selecionar estado
    [Arguments]    ${state}

    Log To Console    \n=== INÍCIO SELEÇÃO ESTADO ===

    Remover anuncios
    Log To Console    Anúncios removidos

    # Remove divs de container de anúncios
    Execute JavaScript    
    ...    const adContainers = document.querySelectorAll('[id*="google_ads"]');
    ...    adContainers.forEach(ad => ad.remove());
    
    Sleep    1s

    # Scroll até o elemento para garantir visibilidade
    Scroll Element Into View    xpath=//div[@id='state']
    Log To Console    Scroll executado
    Sleep    0.5s

    # 3. Clica no container do dropdown (não no input)
    Execute JavaScript    
    ...    const stateDiv = document.getElementById('state');
    ...    stateDiv.scrollIntoView({block: 'center'});
    

    # 4. Clica usando JavaScript para abrir o dropdown
    Execute JavaScript    document.querySelector("#state .css-1wa3eu0-placeholder").click();
    
    Sleep    1s

    # 5. Agora digita no input que apareceu
    Wait Until Element Is Visible    xpath=//input[@id='react-select-3-input']    timeout=5s
    Input Text    xpath=//input[@id='react-select-3-input']    ${state}
    Log To Console    Texto digitado: ${state}
    Sleep    1s
    
    # 6. Pressiona ENTER para selecionar
    Press Keys    xpath=//input[@id='react-select-3-input']    ENTER
    Log To Console    Enter pressionado
    Sleep    1s

    Log To Console    === FIM SELEÇÃO ESTADO ===\n


Selecionar cidade
    [Arguments]    ${city}
    
    # Remove anúncios novamente (podem reaparecer)
    Execute JavaScript    
    ...    document.querySelectorAll('iframe, [id*="google_ads"]').forEach(e => e.remove());
    
    Sleep    1s
    
    # Scroll até cidade
    Scroll Element Into View    xpath=//div[@id='city']
    Sleep    1s
    
    # Foca e digita
    Execute JavaScript    document.querySelector("#react-select-4-input").focus();
    Input Text    xpath=//input[@id='react-select-4-input']    ${city}
    Sleep    0.5s
    Press Keys    xpath=//input[@id='react-select-4-input']    ENTER

Botao submit
    Scroll Element Into View    xpath=//button[@id='submit']
    Sleep    1s
    Click Button    xpath=//button[@id='submit']
    Sleep    1s
    # Aguarda o texto de confirmação aparecer
    Wait Until Element Is Visible    xpath=//div[@id='example-modal-sizes-title-lg']    timeout=10s
    Element Should Contain    xpath=//div[@id='example-modal-sizes-title-lg']    Thanks for submitting the form


Checar pagina
    Wait Until Element Is Visible    xpath=//div[@class='modal-content']    timeout=10s
    Element Should Contain    xpath=//div[@class='modal-header']    Thanks for submitting the form

*** Test Cases ***


Teste 01
    [Documentation]    Esse teste serve para acessar o form
    [Tags]    forms
    Acessar o site
    Wait Until Element Is Visible    locator=${check_home}
    Preencher nome
    Preencher email
    Preencher sexo
    Preencher celular
    Preencher data    4    August    2023
    Preencher pronomes
    Preencher hobbies
    Fazer upload de imagem
    Preencher endereco
    Selecionar estado     NCR
    Selecionar cidade     Delhi
    Botao submit
    