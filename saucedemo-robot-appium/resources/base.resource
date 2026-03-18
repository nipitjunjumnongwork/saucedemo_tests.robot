*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${BROWSER_NAME}     Chrome
${AUTOMATION_NAME}  UiAutomator2
${DEVICE_NAME}      emulator-5554

*** Keywords ***
Open Mobile Browser
    Open Application    ${APPIUM_SERVER}    
    ...                 platformName=${PLATFORM_NAME}
    ...                 deviceName=${DEVICE_NAME}
    ...                 browserName=${BROWSER_NAME}    
    ...                 automationName=${AUTOMATION_NAME}
    Set Appium Timeout   10s

Close Mobile Browser
    Close Application