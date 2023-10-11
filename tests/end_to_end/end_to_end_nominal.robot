*** Settings ***
Metadata            Version    1.0.0

Library             SeleniumLibrary
Resource            ../../resources/end_to_end.resource

Test Setup          Setup browser    ${BASE_URL}    ${BROWSER}
Test Teardown       Teardown browser
Test Template       End to end ok

Test Tags           Nominal


*** Test Cases ***
Test End To End Nominal    test@test.com    5555555555554444    1224    123    38000
