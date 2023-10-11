*** Settings ***
Metadata            Version    1.0.0

Library             SeleniumLibrary
Resource            ../resources/common/common.resource
Resource            ../resources/moisturizers.resource
Resource            ../resources/cart.resource

Test Setup          Setup browser    ${MOISTURIZERS_SEARCH_URL}    ${BROWSER}
Test Teardown       Teardown browser


*** Test Cases ***
Test Add To Cart Ok
    [Tags]    add_moisturizers_to_cart    OK
    moisturizers.Verify page
    moisturizers.Do Task
    cart.Verify page
