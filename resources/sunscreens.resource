*** Settings ***
Library     SeleniumLibrary
Resource    common/common.resource


*** Variables ***
${SUNSCREENS_SEARCH_URL}       https://weathershopper.pythonanywhere.com/sunscreen
${SUNSCREENS_HEADER}           Sunscreens
${SUNSCREENS_TITLE}            The Best Sunscreens in the World!
${SUNSCREENS_NAME_SPF_50}   SPF-50
${SUNSCREENS_NAME_SPF_30}   SPF-30


*** Keywords ***
Do Task
    common.Add least expensive item containing     ${SUNSCREENS_NAME_SPF_50}
    common.Add least expensive item containing     ${SUNSCREENS_NAME_SPF_30}
    common.Wait and click button    locator=xpath://button[@onclick="goToCart()"]


Verify page
    common.Verify page    search_url=${SUNSCREENS_SEARCH_URL}    title=${SUNSCREENS_TITLE}    header=${SUNSCREENS_HEADER}
