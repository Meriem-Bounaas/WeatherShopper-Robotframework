*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    common/common.resource


*** Variables ***
${CART_SEARCH_URL}      https://weathershopper.pythonanywhere.com/cart
${CART_HEADER}          Checkout
${CART_TITLE}           Cart Items


*** Keywords ***
Do Task
    [Arguments]    ${email}    ${card_number}    ${card_expires}    ${card_cvv}    ${zip_code}
    Verify cart

    common.Wait and click element    locator=xpath://span[text()="Pay with Card"]

    Select Frame    locator=xpath://iframe[@name='stripe_checkout_app']
    Enter information
    ...    email=${email}
    ...    card_number=${card_number}
    ...    card_expires=${card_expires}
    ...    card_cvv=${card_cvv}
    ...    zip_code=${zip_code}
    common.Wait and click button    locator=id:submitButton
    Unselect Frame

Enter information
    [Arguments]    ${email}    ${card_number}    ${card_expires}    ${card_cvv}    ${zip_code}
    Enter email    email=${email}
    Enter card number    card_number=${card_number}
    Enter card expires    card_expires=${card_expires}
    Enter card cvv    card_cvv=${card_cvv}
    IF    "${card_number}" != "${EMPTY}"
        Enter billing zip    zip_code=${zip_code}
    END

Enter email
    [Arguments]    ${email}
    common.Wait and input text    locator=id:email    text=${email}

Enter card number
    [Arguments]    ${card_number}
    ${input}    Get WebElement    locator=id:card_number
    Wait Until Element Is Visible    locator=id:card_number
    Wait Until Element Is Enabled    locator=id:card_number
    Send by chunk    input=${input}    text=${card_number}    chunk_size=4

Enter card expires
    [Arguments]    ${card_expires}
    ${input}    Get WebElement    locator=id:cc-exp
    Wait Until Element Is Visible    locator=id:cc-exp
    Wait Until Element Is Enabled    locator=id:cc-exp
    Send by chunk    input=${input}    text=${card_expires}    chunk_size=2

Enter card cvv
    [Arguments]    ${card_cvv}
    common.Wait and input text    locator=id:cc-csc    text=${card_cvv}

Enter billing zip
    [Arguments]    ${zip_code}
    common.Wait and input text    locator=id:billing-zip    text=${zip_code}

Verify cart
    @{item_prices}    Get WebElements    locator=xpath:/html/body/div[1]/div[2]/table/tbody/tr/td[2]
    ${sum_prices}    Get sum prices    ${item_prices}

    ${total_price_text}    Get Text    locator=id:total
    ${total_price}    Fetch From Right    string=${total_price_text}    marker=${SPACE}

    Should Be Equal As Integers    first=${sum_prices}    second=${total_price}

Verify error
    Select Frame    locator=xpath://iframe[@name='stripe_checkout_app']

    @{invalid_inputs}    Get WebElements    locator=xpath://input[contains(@class, 'invalid')]
    ${cnt}    Get length    ${invalid_inputs}
    Should Not Be Equal As Strings    first="${cnt}"    second=0

    Unselect Frame

Verify page
    common.Verify page    search_url=${CART_SEARCH_URL}    title=${CART_TITLE}    header=${CART_HEADER}

