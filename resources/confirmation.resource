*** Settings ***
Library     SeleniumLibrary
Resource    common/common.resource


*** Variables ***
${CONFIRMATION_SEARCH_URL}           https://weathershopper.pythonanywhere.com/confirmation
${CONFIRMATION_HEADER}               PAYMENT SUCCESS
${CONFIRMATION_TITLE}                Confirmation
${CONFIRMATION_SUCCESS_MESSAGE}      Your payment was successful. You should receive a follow-up call from our sales team.


*** Keywords ***
Verify page
    common.Verify page    search_url=${CONFIRMATION_SEARCH_URL}    title=${CONFIRMATION_TITLE}    header=${CONFIRMATION_HEADER}

Do Task
    Verify success message

Verify success message
    Element Text Should Be    locator=css:.text-justify    expected=${CONFIRMATION_SUCCESS_MESSAGE}
