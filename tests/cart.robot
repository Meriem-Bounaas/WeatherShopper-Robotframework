*** Settings ***
Metadata            Version    1.0.0

Library             SeleniumLibrary
Resource            ../resources/common/common.resource
Resource            ../resources/cart.resource
Resource    ../resources/confirmation.resource

Test Setup          Setup browser    ${CART_SEARCH_URL}    ${BROWSER}
Test Teardown       Teardown browser


*** Test Cases ***
Test Checkout Ok
    [Tags]    checkout    ok
    cart.Verify page
    cart.Do Task
    ...    email=test@test.com
    ...    card_number=5555555555554444
    ...    card_expires=1224
    ...    card_cvv=123
    ...    zip_code=38000
    confirmation.Verify page
