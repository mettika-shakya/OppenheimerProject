*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/keywords.robot  #Since keywords file is a robot file we have used as "Resource"

*** Variables ***
${appurl}  http://localhost:8080
${appbrowser}  chrome

*** Test Cases ***
TC 01: Testing Title and Buttons
    launchBrowser   ${appurl}  ${appbrowser}
    verfiyPageTitle
    verifyCsvFileUploadButton
    verifyPageButtons
    close browser



