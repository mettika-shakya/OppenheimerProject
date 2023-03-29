*** Settings ***
Library  DatabaseLibrary
Library  OperatingSystem

Suite Setup  Connect To Database  pymysql   ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}
Suite Teardown  Disconnect From Database

*** Variables ***
${DBName}           mydb
${DBUser}           root
${DBPass}           root
${DBHost}           127.0.0.1
${DBPort}           3306

*** Test Cases ***
TC 01: Create users workingHeroDetails in db
    ${output}=  execute sql string  Create table workingHeroDetails(natid integer, name varchar(100), gender varchar(20), salary integer, birthday varchar(50), tax integer)
    log to console  ${output}
    should be equal as Strings  ${output}   None


TC 02: Inserting data in workingHeroDetails table
#    Inserting single record
    ${output}=  execute sql string  Insert into workingHeroDetails values(123, "John Merry", "Male", 5000, "05-10-1975", 2000)


TC 03: Insert multiple records using script file
    ${output}=  execute sql script  ./Database/mydb_workingHero_insertData.sql
    log to console  ${output}
    should be equal as Strings  ${output}   None


TC 04: Check whether John record available in workingHeroDetails Table
    check if exists in database     select natid from mydb.workingHeroDetails where name="John Johnson";


TC 05: Check whether Jio name record NOT present in workingHeroDetails Table
    check if not exists in database     select natid from mydb.workingHeroDetails where name="Jio";


TC 06: Check whether workingHeroDetails table exists in mydb database
    table must exist    workingHeroDetails


TC 07: Update a record in workingHeroDetails Table
    ${output}=  execute sql string  Update mydb.workingHeroDetails set name="John Hudson" where natid=123;
    log to console  ${output}
    should be equal as Strings  ${output}   None


TC 08: Update a record in workingHeroDetails Table
    ${output}=  execute sql string  Update mydb.workingHeroDetails set natid=100 where name="John Johson";
    log to console  ${output}
    should be equal as Strings  ${output}   None


TC 09: Retrieve all records from workingHeroDetails Table
    @{queryResults}=  query  Select * from mydb.workingHeroDetails;   #queryResults is a list
    log to console  many @{queryResults}


TC 10: Delete a record from workingHeroDetails Table
    ${output}=  execute sql string  Delete from mydb.workingHeroDetails where natid=101;
    should be equal as Strings  ${output}   None