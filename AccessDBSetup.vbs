' Microsoft Access Database Setup Script for ATM Project
' This script creates an Access database with the required tables
' and sample data for the ATM project

Option Explicit

Dim fso, conn, rs, sql, dbPath

' Create FileSystemObject
Set fso = CreateObject("Scripting.FileSystemObject")

' Define the database path
dbPath = "project\atm.accdb"

' Check if file exists and delete it if it does
If fso.FileExists(dbPath) Then
    fso.DeleteFile dbPath
End If

' Create a new Access database
CreateDatabase dbPath

' Create tables and insert data
Set conn = CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath

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

' Function to create a new Access database
Sub CreateDatabase(path)
    Dim cat
    Set cat = CreateObject("ADOX.Catalog")
    cat.Create "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & path
    Set cat = Nothing
End Sub