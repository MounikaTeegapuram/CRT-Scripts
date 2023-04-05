*** Settings ***
Resource          ../Resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End suite


*** Test Cases ***
Entering A Case
    [tags]        ase                         Git Repo Exercise
    Appstate      Home
    LaunchApp     Sales
    ClickText     More
    ClickText     Cases
    VerifyText    Recently Viewed             timeout=120s
    ClickText     New                         anchor=Import
    VerifyText    Case Information
    UseModal      On                          # Only find fields from open modal dialog

    PickList      Status                      New
    PickList      Case Origin                 Web
    PickList      Type                        Question
    PickList      Case Reason                 Instructions not clear
    ClickText     Save                        partial_match=False
    UseModal      Off
    Sleep         2

    ClickText     Details
    VerifyText    Additional Information
    VerifyText    New
    VerifyText    Question
    VerifyText    Web
    VerifyText    Instructions not clear

Repeat above test case with status 'On Hold'
    Appstate      Home
    LaunchApp     Sales
    ClickText     More
    ClickText     Cases
    VerifyText    Recently Viewed             timeout=120s
    ClickText     New                         anchor=Import
    VerifyText    Case Information
    UseModal      On                          # Only find fields from open modal dialog

    PickList      Status                      On Hold
    PickList      Case Origin                 Web
    PickList      Type                        Problem
    PickList      Case Reason                 User didn't attend training
    ClickText     Save                        partial_match=False
    UseModal      Off
    Sleep         2

    ClickText     Details
    VerifyText    Additional Information
    VerifyText    On Hold
    VerifyText    Problem
    VerifyText    Web
    VerifyText    User didn't attend training

Repeat above test case with status as 'Escalated'
    Appstate      Home
    LaunchApp     Sales
    ClickText     More
    ClickText     Cases
    VerifyText    Recently Viewed             timeout=120s
    ClickText     New                         anchor=Import
    VerifyText    Case Information
    UseModal      On                          # Only find fields from open modal dialog

    PickList      Status                      Escalated
    PickList      Case Origin                 Web
    PickList      Type                        Feature Request
    PickList      Case Reason                 Complex functionality
    ClickText     Save                        partial_match=False
    UseModal      Off
    Sleep         2

    ClickText     Details
    VerifyText    Additional Information
    VerifyText    Escalated
    VerifyText    Feature Request
    VerifyText    Web
    VerifyText    Complex functionality

Repeat the above test case without giving Case Origin
    Appstate      Home
    LaunchApp     Sales
    ClickText     More
    ClickText     Cases
    VerifyText    Recently Viewed             timeout=120s
    ClickText     New                         anchor=Import
    VerifyText    Case Information
    UseModal      On                          # Only find fields from open modal dialog

    PickList      Status                      Escalated
    PickList      Case Origin                 --None--
    PickList      Type                        Feature Request
    PickList      Case Reason                 Complex functionality
    ClickText     Save                        partial_match=False
    VerifyText    Complete this field         anchor=Case Origin
    UseModal      Off
    Sleep         2

    ClickText     Cancel

Update Existing Case
    Appstate      Home
    LaunchApp     Sales
    ClickText     More
    ClickText     Cases
    VerifyText    Recently Viewed             timeout=120s

    ClickText     00001007
    ClickText     Edit Status
    PickList      *Status                     On Hold
    PickList      Type                        Problem
    PickList      *Case Origin                Email
    ClickText     Save
    VerifyText    On Hold
    VerifyText    Problem
    VerifyText    Email                       anchor=Case Origin

Delete Tina Smith's Lead
    [tags]        Lead                        Git Repo Exercise
    LaunchApp     Sales
    ClickText     Cases
    VerifyText    Recently Viewed             timeout=120s

    ClickText     00001007
    ClickText     Delete
    ClickText     Delete
    ClickText     Close