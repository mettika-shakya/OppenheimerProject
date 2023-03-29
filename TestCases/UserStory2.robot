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
${API_URL}    http://localhost:8080/calculator/insertMultiple
${DB_NAME}    mydb
${DB_USER}    root
${DB_PASSWORD}    root
${DB_HOST}    127.0.0.1
${DB_PORT}    3306

*** Test Cases ***
TC 01: Insert List into Database via API
    # Creating the data to be inserted as a dictionary
    ${data}    Create Dictionary    natid=104    name=John Doe    gender=Male    salary=7000  birthday=05/10/1975     tax=3000

     # Creating a session
    Create Session    my_session    ${API_URL}

    # Sending a POST request to the API
    ${response}    POST On Session    my_session    url=${API_URL}    json=${data}

    # Verifying the response is successful
    Should Be Equal As Strings    ${response.status_code}    201

     # Converting the response data to a dictionary using the json() method
    ${response_data}    Set Variable    ${response.json()}

    # Connecting to the database
    Connect To Database    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}

    # Inserting the data into the database
    Execute Sql String    INSERT INTO workingherodetails (natid, name, gender, salary, birthday, tax) VALUES ('${data.natid}', '${data.name}', '${data.gender}', '${data.salary}', '${data.birthday}', '${data.tax}')

    # Verifying that the data is inserted successfully
    ${result}    Query    SELECT * FROM workingherodetails WHERE name='${data.name}'
    log to console  ${result}
    Should Be True    len(${result}) == 1
