*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/keywords.robot  #Since keywords file is a robot file we have used as "Resource"
Suite Setup     launchBrowser   ${appurl}  ${appbrowser}
Suite Teardown      close browser
Documentation   Script to upload a file

*** Variables ***
${appurl}  http://localhost:8080
${appbrowser}  chrome
${btn_newFileUpload}   //input[@type='file']
${verify_uploadFile}    //p[@id="uploadedFilePath"]
${FileTo_Upload}    NewHeroDetails3.csv

*** Test Cases ***
TC 01: Verify whether the CSV File Upload button is available
    verifyCsvFileUploadButton

TC 01: Upload csv file to the portal
    scroll element into view    xpath://label[normalize-space()='Choose file']
    sleep   2
    choose file     ${btn_newFileUpload}    ${CURDIR}${/}${FileTo_Upload}
    sleep   5










