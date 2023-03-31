*** Settings ***
Library  RequestsLibrary
Library  DatabaseLibrary
Library  OperatingSystem
Library  Collections
Library  RequestsLibrary
Library  String
Library  JSONLibrary

Suite Setup  Connect To Database  pymysql   ${DB_NAME}   ${DB_USER}   ${DB_PASSWORD}   ${DB_HOST}   ${DB_PORT}
Suite Teardown  Disconnect From Database

*** Variables ***
${API_URL}    http://localhost:8080/calculator/insert
${DB_NAME}    mydb
${DB_USER}    root
${DB_PASSWORD}    root
${DB_HOST}    127.0.0.1
${DB_PORT}    3306

*** Test Cases ***
TC 01: Insert List into Database via API
    ${data}    Create Dictionary    natid=104    name=John Doe    gender=M    salary=7000  birthday=05101975     tax=3000
    Create Session    my_session    ${API_URL}
    ${response}    POST On Session    my_session    url=${API_URL}    json=${data}
    Should Be Equal As Strings  ${response.content}  Alright
    Should Be Equal As Strings    ${response.status_code}    202
#    Should Be Equal As Strings    ${response.body}      Alright
#    Connect To Database    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
#    Execute Sql String    INSERT INTO workingherodetails (natid, name, gender, salary, birthday, tax) VALUES ('${data.natid}', '${data.name}', '${data.gender}', '${data.salary}', '${data.birthday}', '${data.tax}')

    # Verifying that the data is inserted successfully

