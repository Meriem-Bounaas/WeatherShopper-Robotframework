*** Settings ***
Metadata            Version    1.0.0

Library             SeleniumLibrary
Resource            ../resources/common/common.resource
Resource            ../resources/current_temperature.resource

Test Setup          Setup browser    ${CURRENT_TEMPERATURE_SEARCH_URL}    ${BROWSER}
Test Teardown       Teardown browser


*** Test Cases ***
Test Shop Moisturizers Or Sunscreens Ok
    [Tags]    moisturizers_or_sunscreens    OK
    current_temperature.Verify page
    current_temperature.Do Task
    # Verify shop page
