*** Settings ***
Library     SeleniumLibrary
Library     ../lib/CustomLib.py


*** Variables ***
${BROWSER}      chrome

${BASE_URL}     https://weathershopper.pythonanywhere.com/


*** Keywords ***
Wait and click element
    [Arguments]    ${locator}    ${timeout}=10 seconds
    Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    locator=${locator}    timeout=${timeout}
    Click Element    locator=${locator}

Wait and click button
    [Arguments]    ${locator}    ${timeout}=10 seconds
    Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    locator=${locator}    timeout=${timeout}
    Click Button    locator=${locator}

Wait and click link
    [Arguments]    ${locator}    ${timeout}=10 seconds
    Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    locator=${locator}    timeout=${timeout}
    Click Link    locator=${locator}

Wait and input text
    [Arguments]    ${locator}    ${text}    ${timeout}=10 seconds
    Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    locator=${locator}    timeout=${timeout}
    Input Text    locator=${locator}    text=${text}

Verify page
    [Arguments]    ${search_url}    ${title}    ${header}
    Wait Until Location Contains    expected=${search_url}
    Location Should Contain    expected=${search_url}
    Title Should Be    title=${title}
    Element Text Should Be    locator=xpath://h2    expected=${header}

Add least expensive item containing
    [Arguments]    ${name}
    @{price_elms_containing_name}    Get WebElements
    ...    locator=//p[contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), translate('${name}', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))]/following-sibling::p
    
    ${minimum_price}    Get Minimum Price    elements=${price_elms_containing_name}

    ${least_expensive_item_btn}    Get WebElement    locator=xpath://button[contains(@onclick, '${minimum_price}')]
    Wait and click button    ${least_expensive_item_btn}

Setup browser
    [Arguments]    ${url}    ${browser}
    Set Selenium Implicit Wait    10 seconds
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window

Teardown browser
    Close Browser
