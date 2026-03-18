*** Settings ***
Library    AppiumLibrary
Library    Collections
Library    String

*** Variables ***
${FILTER_BUTTON}      xpath=//div[@id='header_container']//select[@class='product_sort_container']
${SORT_PRICE_HILO}    xpath=//option[@value='hilo']
${PRODUCT_PRICES}     xpath=//div[@class='inventory_item_price']
${INVENTORY_LIST}     xpath=//div[@class='inventory_list']

*** Keywords ***
Sort Products By Price High To Low
    Wait Until Element Is Visible    ${FILTER_BUTTON}    timeout=15s
    Click Element    ${FILTER_BUTTON}
    
    Wait Until Element Is Visible    ${SORT_PRICE_HILO}    timeout=10s
    Click Element    ${SORT_PRICE_HILO}
    
    Wait Until Element Is Visible    ${INVENTORY_LIST}    timeout=15s
    Sleep    5s   

Validate Products Sorted By Price High To Low
    Wait Until Element Is Visible    ${PRODUCT_PRICES}    timeout=10s
    
    ${elements}=    Get WebElements    ${PRODUCT_PRICES}
    ${actual_prices}=    Create List
    
    FOR    ${el}    IN    @{elements}
        ${price_text}=    Get Text    ${el}
        ${price_num}=    Remove String    ${price_text}    $
        ${price_float}=    Convert To Number    ${price_num}
        Append To List    ${actual_prices}    ${price_float}
    END
    
    ${expected_prices}=    Copy List    ${actual_prices}
    Sort List    ${expected_prices}
    Reverse List    ${expected_prices}
    
    Lists Should Be Equal    ${actual_prices}    ${expected_prices}  