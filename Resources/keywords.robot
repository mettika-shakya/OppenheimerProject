*** Settings ***
Library  SeleniumLibrary
Library  String
Variables  ../PageObjects/locators.py   #Since locators file is a python file we have used as "Variables"

*** Keywords ***
launchBrowser   #User defined keyword with arguments and return value which can be called in any other test cases file
    [Arguments]     ${appurl}   ${appbrowser}
    open browser    ${appurl}   ${appbrowser}
    maximize browser window
    ${title}=   get title
    [Return]    ${title}

verfiyPageTitle
    title should be  Technical Challenge for CDS

verifyPageButtons
    element should be visible   ${btn_browse}
    element should be visible   ${btn_refreshTaxRelief}
    element should be visible   ${btn_visitSwagger}
    element should be visible   ${btn_dispenseNow}

verifyCsvFileUploadButton
    element should be enabled   ${btn_uploadCSVfile}

verifyDispenseNowRedirection
    element should be enabled   ${btn_dispenseNow}
    click link    ${btn_dispenseNow}
    sleep   3
    ${location}=    get location
#    log to console      ${location}
    title should be     Dispense!!
    page should contain     Cash dispensed

verifyDispenseNowBtnColor
    element should be visible   ${btn_dispenseNow}

    ${button_color1}=    Get WebElement    ${btn_dispenseNow}
    ${bg_color}    Call Method    ${button_color1}    value_of_css_property    background-color
    ${button_color2}=    Get Element Attribute    ${btn_dispenseNow}  class

    log to console  ${EMPTY}
    log to console  ${bg_color}
    log to console  ${button_color2}
#    Should Be Equal As Strings      ${button_color}     "#dc3545"

verifyDispenseNowBtnTxt
    element should be visible   ${btn_dispenseNow}
    element text should be      ${btn_dispenseNow}      Dispense Now
    ${btn_dispenseNowValue}     get text    ${btn_dispenseNow}
    log to console      ${btn_dispenseNowValue}

closeBrowser
    close all browsers

