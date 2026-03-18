*** Settings ***
Library    AppiumLibrary

*** Variables ***
${URL}              https://www.saucedemo.com/
${USERNAME_FIELD}    xpath=//input[@id='user-name']
${PASSWORD_FIELD}    xpath=//input[@id='password']
${LOGIN_BTN}         xpath=//input[@id='login-button']
${SHOPPING_CART}     xpath=//div[@id='shopping_cart_container']

*** Keywords ***
Go To Login Page
    Go To Url    ${URL}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=15s
    Input Text       ${USERNAME_FIELD}    ${username}
    Input Text       ${PASSWORD_FIELD}    ${password}
    Click Element    ${LOGIN_BTN}

Verify Login Success
    Wait Until Element Is Visible    ${SHOPPING_CART}    timeout=15s