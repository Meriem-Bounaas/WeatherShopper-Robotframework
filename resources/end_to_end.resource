*** Settings ***
Library     SeleniumLibrary
Resource    common/common.resource
Resource    current_temperature.resource
Resource    moisturizers.resource
Resource    sunscreens.resource
Resource    cart.resource
Resource    confirmation.resource


*** Variables ***


*** Keywords ***
End to end
    [Arguments]    ${email}    ${card_number}    ${card_expires}    ${card_cvv}    ${zip_code}
    current_temperature.Verify page
    ${shop_page}    current_temperature.Do Task
    IF    "${shop_page}" == "Moisturizers"
        moisturizers.Do Task
    ELSE IF    "${shop_page}" == "Sunscreens"
        sunscreens.Do Task
    END

    cart.Do Task
    ...    email=${email}
    ...    card_number=${card_number}
    ...    card_expires=${card_expires}
    ...    card_cvv=${card_cvv}
    ...    zip_code=${zip_code}

End to end ok
    [Arguments]    ${email}    ${card_number}    ${card_expires}    ${card_cvv}    ${zip_code}    
    End to end    ${email}    ${card_number}    ${card_expires}    ${card_cvv}    ${zip_code}

    confirmation.Do Task
    confirmation.Verify page

End to end ko
    [Arguments]    ${email}    ${card_number}    ${card_expires}    ${card_cvv}    ${zip_code}   
    End to end    ${email}    ${card_number}    ${card_expires}    ${card_cvv}    ${zip_code}

    cart.Verify error
