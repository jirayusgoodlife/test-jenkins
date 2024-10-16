*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://reg.buu.ac.th

*** Test Cases ***
Verify Website Title in Headless Mode
    Open Browser    ${URL}    Firefox    ff_options=-headless
    Title Should Be    ระบบบริการการศึกษา มหาวิทยาลัยบูรพา
    [Teardown]    Close Browser
