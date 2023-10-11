*** Settings ***
Metadata            Version    1.0.0

Library             SeleniumLibrary
Resource            ../resources/common/common.resource
Resource            ../resources/sunscreens.resource
Resource            ../resources/cart.resource

Test Setup          Setup browser    ${SUNSCREENS_SEARCH_URL}    ${BROWSER}
Test Teardown       Teardown browser


*** Test Cases ***
Test Add To Cart Ok
    [Tags]    add_sunscreens_to_cart    OK
    sunscreens.Verify page
    sunscreens.Do Task
    cart.Verify page
