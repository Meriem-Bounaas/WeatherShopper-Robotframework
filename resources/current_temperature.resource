*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    common/common.resource
Resource    sunscreens.resource


*** Variables ***
${CURRENT_TEMPERATURE_SEARCH_URL}       https://weathershopper.pythonanywhere.com/
${CURRENT_TEMPERATURE_HEADER}           Current temperature
${CURRENT_TEMPERATURE_TITLE}            Current Temperature
${moisturizers_btn}                     xpath://button[text()="Buy moisturizers"]


*** Keywords ***
Do Task
    ${temperature_text}    Get Text    locator=id:temperature
    ${temperature}    Fetch From Left    string=${temperature_text}    marker=${SPACE}
    IF    ${temperature} < 19
        Click moisturizers
        ${shop_page}    Set Variable    Moisturizers
    ELSE IF    ${temperature} > 34
        Click sunscreens
        ${shop_page}    Set Variable    Sunscreens
    ELSE
        Log    message=No action defined for such temperature: ${temperature}
    END
    RETURN    ${shop_page}

Click moisturizers
    common.Wait and click button    locator=${moisturizers_btn}

Click sunscreens
    common.Wait and click button    locator=xpath://button[text()="Buy sunscreens"]

Verify page
    common.Verify page    search_url=${CURRENT_TEMPERATURE_SEARCH_URL}    title=${CURRENT_TEMPERATURE_TITLE}    header=${CURRENT_TEMPERATURE_HEADER}
