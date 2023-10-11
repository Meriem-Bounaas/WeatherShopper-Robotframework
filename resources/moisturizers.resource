*** Settings ***
Library     SeleniumLibrary
Resource    common/common.resource


*** Variables ***
${MOISTURIZERS_SEARCH_URL}       https://weathershopper.pythonanywhere.com/moisturizer
${MOISTURIZERS_HEADER}           Moisturizers
${MOISTURIZERS_TITLE}            The Best Moisturizers in the World!
${MOISTURIZERS_NAME_ALOE}    Aloe
${MOISTURIZERS_NAME_ALMOND}    almond


*** Keywords ***
Do Task
    common.Add least expensive item containing     ${MOISTURIZERS_NAME_ALOE}
    common.Add least expensive item containing     ${MOISTURIZERS_NAME_ALMOND}
    common.Wait and click button    locator=xpath://button[@onclick="goToCart()"]
    

Verify page
    common.Verify page    search_url=${MOISTURIZERS_SEARCH_URL}    title=${MOISTURIZERS_TITLE}    header=${MOISTURIZERS_HEADER}
