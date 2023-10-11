*** Settings ***
Metadata            Version    1.0.0

Library             SeleniumLibrary
Resource            ../../resources/end_to_end.resource

Test Setup          Setup browser    ${BASE_URL}    ${BROWSER}
Test Teardown       Teardown browser
Test Template       End to end ko

Test Tags           Exception


*** Test Cases ***
Test End To End Exception All Inputs Empty    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
Test End To End Exception Invalid Email    test    5555555555554444    1224    123    38000
Test End To End Exception Invalid Card Number    test@test.com    5555555555555555    1224    123    38000
Test End To End Exception Invalid Card Expires    test@test.com    5555555555554444    12    123    38000
Test End To End Exception Invalid Card CVV    test@test.com    5555555555554444    1224    12    38000
Test End To End Exception Invalid Zip Code    test@test.com    5555555555554444    1224    123    ${EMPTY}
