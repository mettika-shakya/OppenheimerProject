*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://localhost:8080

*** Test Cases ***
TC 01: Return list of working class hero with tax relief
    create session  taxReliefSession    ${base_url}
    ${response}=    get on session      taxReliefSession    /calculator/taxRelief
    log to console      ${response.status_code}
    log to console      ${response.content}

    #Validating response status code
    ${status_code}=     convert to string   ${response.status_code}
    should be equal     ${status_code}      200

