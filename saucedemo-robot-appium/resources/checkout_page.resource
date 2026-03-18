*** Settings ***
Library           AppiumLibrary
Library           Collections

*** Variables ***
${REMOTE_URL}           http://localhost:4723
${PLATFORM_NAME}        Android
${BROWSER_NAME}         Chrome
${AUTOMATION_NAME}      UIAutomator2
${DEVICE_NAME}          emulator-5554
${TIMEOUT}              30s

*** Keywords ***
Open SauceDemo On Mobile Chrome
    ${args}=    Create List    --no-first-run    --disable-fre    --no-default-browser-check
    ${chrome_options}=    Create Dictionary    args=${args}
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    browserName=${BROWSER_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    newCommandTimeout=300
    ...    chromeOptions=${chrome_options}
    
    Sleep    5s
    ${contexts}=    Get Contexts
    Set Context    ${contexts}[-1]
    Go To Url    https://www.saucedemo.com/
    Wait Until Page Contains Element    xpath=//*[@id='user-name']    timeout=${TIMEOUT}

Login To Application
    [Arguments]    ${user}    ${pass}
    Wait Until Element Is Visible    xpath=//*[@id='user-name']    timeout=${TIMEOUT}
    Input Text      xpath=//*[@id='user-name']    ${user}
    Input Password  xpath=//*[@id='password']     ${pass}
    Click Element   xpath=//*[@id='login-button']
    Wait Until Page Contains Element    xpath=//div[@class='inventory_list']    timeout=${TIMEOUT}

Add All Products By Price
    [Arguments]    ${price}
    ${TARGET_XPATH}=    Set Variable    xpath=//div[contains(.,'${price}')]/ancestor::div[@class='inventory_item_description']//button[text()='Add to cart']
    
    FOR    ${index}    IN RANGE    0    6
        ${status}=    Run Keyword And Return Status    Page Should Contain Element    ${TARGET_XPATH}
        IF    ${status}
            ${buttons}=    Get WebElements    ${TARGET_XPATH}
            FOR    ${btn}    IN    @{buttons}
                Click Element    ${btn}
                Sleep    0.5s
            END
        END
        Swipe By Percent    50    75    50    25    duration=1000ms
        Sleep    1s
    END

Scroll To Bottom And Top
    FOR    ${i}    IN RANGE    0    10
        Swipe By Percent    50    85    50    15    duration=400ms
    END
    Sleep    1s
    FOR    ${i}    IN RANGE    0    10
        Swipe By Percent    50    15    50    85    duration=400ms
    END
    Sleep    1s

Go To Shopping Cart
    Wait Until Element Is Visible    xpath=//a[@class='shopping_cart_link']    timeout=${TIMEOUT}
    Click Element                    xpath=//a[@class='shopping_cart_link']

Fill Checkout Information
    [Arguments]    ${f_name}    ${l_name}    ${zip}
    Swipe By Percent    50    80    50    40    duration=800ms
    Wait Until Element Is Visible    xpath=//*[@id='checkout']    timeout=15s
    Click Element    xpath=//*[@id='checkout']
    
    Wait Until Element Is Visible    xpath=//*[@id='first-name']    timeout=${TIMEOUT}
    Input Text    xpath=//*[@id='first-name']    ${f_name}
    Input Text    xpath=//*[@id='last-name']     ${l_name}
    Input Text    xpath=//*[@id='postal-code']   ${zip}
    
    Run Keyword And Ignore Error    Hide Keyboard
    Swipe By Percent    50    80    50    30    duration=800ms
    
    Wait Until Element Is Visible    xpath=//*[@id='continue']    timeout=15s
    Click Element    xpath=//*[@id='continue']

Verify Purchase Success
    
    Wait Until Page Contains Element    xpath=//*[@id="finish"]    timeout=${TIMEOUT}
    
    AppiumLibrary.Execute Script    document.getElementById('finish').click()
    

    Wait Until Page Contains Element    xpath=//h2[@class="complete-header"]    timeout=${TIMEOUT}
    Element Text Should Be              xpath=//h2[@class="complete-header"]    Thank you for your order!

Close SauceDemo Application
    Run Keyword And Ignore Error    Close Application