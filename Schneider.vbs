Option Explicit

Dim client

'*--Creating the seetest client and setting up the project base directory
Set client = DotNetFactory.CreateInstance("experitestClient.Client", "C:\\Program Files (x86)\\Experitest\\SeeTest\\clients\\C#\\imageClient.dll", "127.0.0.1", 8889, true)
client.SetProjectBaseDirectory "C:\\Users\\surendra\\workspace\\project2"

validateLoginFlow "demo@demo.com","demo"

'*---Validate the login flow
Sub validateLoginFlow(str_Userid,str_Password)
	On Error Resume Next
	'Declaration of the variables
	Dim refLabel,serialLabel
	client.Launch "com.schneiderelectric.qatest/.MainActivity", true, true
	Report
	'If the login button is not displayed on the app launch it goes to the else statement and report the launch failure of the app.
	If StrComp (client.WaitForElement ( "WEB", "xpath=//*[@id='submit' and @text=' Login ' and @hidden='false' and @onScreen='true']", 0, 10000 ), "True") = 0 Then
		Report
		'Entering the user id in the user id field
		client.ElementSendText "WEB", "xpath=//*[@id='username' and @name='email' and @hidden='false' and @onScreen='true']", 0, str_Userid
		Report
		'Entering the password in password id field
		client.ElementSendText "WEB", "xpath=//*[@id='password' and @name='password' and @hidden='false' and @onScreen='true']", 0, str_Password
		Report
		client.Click "WEB", "xpath=//*[@id='submit' and @text=' Login ' and @hidden='false' and @onScreen='true']", 0, 1
		Report
		'If welcome page is displayed it continues to further validation of reading the values else exit
		If StrComp (client.WaitForElement ( "WEB", "xpath=//*[@nodeName='H3' and @text=' Welcome home! ' and @hidden='false' and @onScreen='true']", 0, 10000 ), "True") = 0 Then
			Report
			client.Click "WEB", "xpath=//*[@nodeName='SPAN' and @css='SPAN.left-buttons' and @class='left-buttons' and @hidden='false' and @onScreen='true']", 0, 1
			Report
			client.Click "WEB", "xpath=//*[@nodeName='A' and @text='  About  ' and @hidden='false' and @onScreen='true']", 0, 1
			Report
			refLabel = client.ElementGetText ( "WEB", "xpath=//*[@nodeName='DIV' and @id='refLabel' and @hidden='false' and @onScreen='true']", 0 )
			Report
			serialLabel = client.ElementGetText ( "WEB", "xpath=//*[@nodeName='DIV' and @id='serialLabel' and @hidden='false' and @onScreen='true']", 0 )
			Report
			client.Click "WEB", "xpath=//*[@nodeName='SPAN' and contains(@class,'button-clear.button-large') and @hidden='false' and @onScreen='true']", 0, 1
			Report
		Else
			Report
		End If
	Else
		Report
	End If
End Sub


'subroutine to Logout of the appication
Sub Logout()
	'Logout flow will continue only when it sees the welcome home message else it will exit.
	If StrComp (client.WaitForElement ( "WEB", "xpath=//*[@nodeName='H3' and @text=' Welcome home! ' and @hidden='false' and @onScreen='true']", 0, 10000 ), "True") = 0 Then
		Report
		client.Click "WEB", "xpath=//*[@nodeName='SPAN' and @css='SPAN.left-buttons' and @class='left-buttons' and @hidden='false' and @onScreen='true']", 0, 1
		Report
		client.Click "WEB", "xpath=//*[@nodeName='H5' and @class='user-email ellipsis' and @hidden='false' and @onScreen='true']", 0, 1
		Report
		client.Click "WEB", "xpath=//*[@nodeName='A' and @text='  Logout  ' and @hidden='false' and @onScreen='true']", 0, 1
		Report
		client.WaitForElement "WEB", "xpath=//*[@id='submit' and @text=' Login ' and @hidden='false' and @onScreen='true']", 0, 10000 
		Report
	End If
End Sub

	
'Tell the server to release this client's resources
'and make the devices used by it available to others:
client.releaseClient
'In VBScript we must also release the COM Object Instance,
'otherwise it keeps a live thread that pings the server:
set client = nothing


Sub Report()
Dim logLine, outFile, status, errorMessage
logLine = client.GetResultValue ("logLine")
outFile = client.GetResultValue("outFile")
'Waiting 10 seconds for the report image to be saved to disk:
Set fso = CreateObject("Scripting.FileSystemObject")
timeLimit = DateAdd("s", 10, Now())
Do Until (Now() > timeLimit OR fso.FileExists(outFile))
Loop

status = client.GetResultValue("status")
If StrComp (status, "True") = 0 then
	Reporter.ReportEvent micPass, logLine, "", outFile
Else 
	errorMessage = client.GetResultValue("errorMessage")
	Reporter.ReportEvent micFail, logLine, errorMessage, outFile
End If
End Sub
