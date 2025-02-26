Imports System.Data.OleDb
Public Class Form4
    Dim con As OleDbConnection
    Dim cmd As OleDbCommand
    Dim dr As OleDbDataReader
    Private Sub Form4_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Dim pin As Integer
            Dim acc As Integer
            pin = Val(Form1.txtpin.Text)
            acc = Val(Form1.txtacc.Text)

            con = New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\atm.accdb;")
            con.Open()
            cmd = New OleDbCommand("select pin_no, acc_no, name, balance from Login where pin_no=" & pin & " and acc_no=" & acc, con)
            dr = cmd.ExecuteReader
            If dr.Read Then

                lbluser.Text = dr(2)
                lblamount.Text = dr(3)

                dr.Close()
                con.Close()
            Else
                MessageBox.Show("please try again", "error!!!!!")
                Me.Close()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Hide()
        Form2.Show()
    End Sub
End Class