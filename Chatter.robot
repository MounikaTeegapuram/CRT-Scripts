*** Settings ***
Resource          ../resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End suite


*** Test Cases ***
Login as a user and navigate to 'Chatter Groups'. Post atleast 10 posts in the group.
    [tags]        Groups                     Git Repo Exercise
    Appstate      Home
    LaunchApp     Groups

    ${i}          Set Variable               0
    WHILE         ${i} < 10
    
        ClickText     TestCRTChatterGroup
        ClickText     Share an update...
        TypeText      Share an update...         Text ${i}
        ClickText     Share
    
        VerifyText    Latest Post                timeout=120s
        VerifyText    Test ${i}
    
        ${i}=          Evaluate                   ${i} + 1        
    END