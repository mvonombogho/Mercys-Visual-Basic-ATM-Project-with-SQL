' Microsoft Access Database Setup Script for ATM Project
' This script creates an Access database with the required tables
' and sample data for the ATM project
' Optimized for Microsoft 365 Access

Option Explicit

Dim fso, conn, sql, dbPath, objShell
Dim strAccess, isSuccess

' Create FileSystemObject
Set fso = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("WScript.Shell")

' Define the database path - use current directory
dbPath = fso.BuildPath(fso.GetParentFolderName(WScript.ScriptFullName), "project\atm.accdb")

' Create the project directory if it doesn't exist
Dim projectDir
projectDir = fso.BuildPath(fso.GetParentFolderName(WScript.ScriptFullName), "project")
If Not fso.FolderExists(projectDir) Then
    fso.CreateFolder(projectDir)
End If

' Check if file exists and delete it if it does
If fso.FileExists(dbPath) Then
    fso.DeleteFile dbPath
End If

' Try to create the database using Microsoft 365 Access if it's installed
isSuccess = False

' Method 1: Try to use Access automation to create the database
On Error Resume Next
Dim objAccess
Set objAccess = CreateObject("Access.Application")
If Err.Number = 0 Then
    WScript.Echo "Using Microsoft 365 Access to create the database..."
    objAccess.NewCurrentDatabase dbPath
    objAccess.Visible = False
    WScript.Sleep 2000 ' Give Access time to create the file
    objAccess.Quit
    Set objAccess = Nothing
    isSuccess = True
End If
On Error GoTo 0

' Method 2: If Access automation failed, try using ADOX if it's available
If Not isSuccess Then
    On Error Resume Next
    Dim cat
    Set cat = CreateObject("ADOX.Catalog")
    If Err.Number = 0 Then
        WScript.Echo "Using ADOX to create the database..."
        cat.Create "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath
        Set cat = Nothing
        isSuccess = True
    End If
    On Error GoTo 0
End If

' Method 3: If both methods above failed, try using a blank file as a template
If Not isSuccess Then
    WScript.Echo "Creating empty database file..."
    Dim strCmd
    strCmd = "cmd /c echo Creating blank Access database... & copy NUL " & Chr(34) & dbPath & Chr(34)
    objShell.Run strCmd, 0, True
End If

WScript.Echo "Creating database at: " & dbPath
WScript.Sleep 1000

' Create tables and insert data
On Error Resume Next

Set conn = CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath & ";"

If Err.Number <> 0 Then
    WScript.Echo "Error connecting to database: " & Err.Description & " (" & Err.Number & ")"
    WScript.Echo "Even though you have Microsoft 365 Access installed, you might need the Access Database Engine."
    WScript.Echo "You can download it from https://www.microsoft.com/en-us/download/details.aspx?id=13255"
    WScript.Quit
End If

On Error GoTo 0

WScript.Echo "Successfully connected to the database. Creating tables..."

' Create PIN table
sql = "CREATE TABLE pin (" & _
      "pin_no INTEGER, " & _
      "acc_no INTEGER)"
conn.Execute sql

' Insert sample data into PIN table
sql = "INSERT INTO pin (pin_no, acc_no) VALUES (1234, 55555)"
conn.Execute sql
sql = "INSERT INTO pin (pin_no, acc_no) VALUES (5678, 66666)"
conn.Execute sql
sql = "INSERT INTO pin (pin_no, acc_no) VALUES (3456, 00000)"
conn.Execute sql
sql = "INSERT INTO pin (pin_no, acc_no) VALUES (6789, 11111)"
conn.Execute sql

' Create Login table
sql = "CREATE TABLE Login (" & _
      "pin_no INTEGER, " & _
      "acc_no INTEGER, " & _
      "name TEXT(40), " & _
      "balance INTEGER)"
conn.Execute sql

' Insert sample data into Login table
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (1234, 111, 'Asha', 11000)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (2345, 325, 'Asha', 23456)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (3456, 756, 'denny', 46563)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (4567, 575, 'ken', 56356)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (5678, 222, 'Kenn', 11000)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (6789, 223, 'disha', 98989)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (7890, 224, 'sammi', 91000)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (8901, 225, 'ketan', 6795687)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (9012, 333, 'Denny', 11000)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (1470, 444, 'Pihu', 11000)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (2580, 555, 'Agrima', 11000)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (3690, 666, 'Arushi', 11000)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (1111, 777, 'Ayushri', 16000)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (2222, 728, 'daizy', 1111)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (3333, 567, 'Louis', 2345)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (4444, 888, 'Lewis', 4776)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (5555, 646, 'gucci', 3333)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (6666, 967, 'parada', 9047)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (7777, 343, 'tommy', 7465)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (8888, 636, 'elena', 798749)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (9999, 434, 'demon', 6584)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (0000, 234, 'stefan', 5664676)"
conn.Execute sql
sql = "INSERT INTO Login (pin_no, acc_no, name, balance) VALUES (8989, 123, 'won injae', 98777)"
conn.Execute sql

' Close the connection
conn.Close

WScript.Echo "Microsoft Access database created successfully at: " & dbPath
WScript.Echo "You may now open the Visual Basic project and run it."