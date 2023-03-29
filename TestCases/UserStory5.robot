*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/keywords.robot  #Since keywords file is a robot file we have used as "Resource"
Suite Setup     launchBrowser   ${appurl}  ${appbrowser}
Suite Teardown      close browser

*** Variables ***
${appurl}  http://localhost:8080
${appbrowser}  chrome

*** Test Cases ***
TC 01: Verify Dispense Now Button Colour
    verifyDispenseNowBtnColor
    sleep   2

TC 02: Verify Dispense Now Button Text
    verifyDispenseNowBtnTxt
    sleep   2

TC 03: Verify Dispense Now Button Redirect to Cash dispensed page
    verifyDispenseNowRedirection




