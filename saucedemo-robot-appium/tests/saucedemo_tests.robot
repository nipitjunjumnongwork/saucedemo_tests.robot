*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/login_page.resource
Resource    ../resources/products_page.resource
Resource    ../resources/checkout_page.resource

Test Setup       Open Mobile Browser
Test Teardown    Close Mobile Browser

*** Test Cases ***
User Should Be Able To Login With Valid Credentials
    Go To Login Page
    Login With Credentials    standard_user    secret_sauce
    Verify Login Success

User Should Be Able To Sort Products By Price High To Low
    Go To Login Page
    Login With Credentials    standard_user    secret_sauce
    Sort Products By Price High To Low
    Validate Products Sorted By Price High To Low

๊ี๊User Should Be Able to Purchase For All $15.99 Items
    Go To Login Page
    Login To Application    standard_user    secret_sauce
    Add All Products By Price    15.99
    Scroll To Bottom And Top
    Go To Shopping Cart
    Fill Checkout Information    Nipit    Mark    10210
    Verify Purchase Success