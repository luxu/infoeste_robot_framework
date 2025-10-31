*** Settings ***

Resource    main.robot
Library    .venv/lib/python3.12/site-packages/robot/libraries/Dialogs.py
Library    .venv/lib/python3.12/site-packages/robot/libraries/XML.py

*** Keywords ***

Abrir navegador
    Open Browser    ${site}   chrome
    Maximize Browser Window

Selecionar o carros
    Click Element    locator=//a[normalize-space(text())='ACURA']

Selecionar o ano
    Sleep    2s
    Click Element    locator=//a[normalize-space(text())='2025']

Selecionar modelo
    Sleep    2s
    Click Element    locator=//a[normalize-space(text())='ADX']

Selecionar servico
    Sleep    2s
    Click Element    locator=//a[normalize-space(text())='Fuel & Air']

Adicionar primeiro produto no carrinho
    Sleep    2s
    Click Element    locator=(//input[@value='Add to Cart >']/following-sibling::a)[3]
    Sleep    1s

Voltar a comprar
    Sleep    2s
    Click Element    locator=//div[contains(@class,'show-if-js ra-btn')]

Adicionar segundo produto no carrinho
    Sleep    2s
    Click Element    locator=(//*[@id="vew_btnaddtocart[386]"]/a/span)
    Sleep    1s

Ver produtos comprados
    Sleep    2s
    Element Should Be Visible    locator=(//div[@class='desktop_cart_qty_circle'])[1]
    ${qt}=     Get Element Attribute    locator=(//div[@class='desktop_cart_qty_circle'])[1]    attribute=text
    IF   "${qt}" != "2"
        Log To Console    message=Entrou no IF...Valor.: ${qt}
    END
    # Pause Execution
    
