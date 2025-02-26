Imports System.Data.SqlClient
Public Class Form4
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Private Sub Form4_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Dim pin As Integer
            Dim acc As Integer
            pin = Val(Form1.txtpin.Text)
            acc = Val(Form1.txtacc.Text)

            con = New SqlConnection("Data Source=JKWORLD\SQLEXPRESS2; Initial Catalog=atm; Integrated Security=True")
            con.Open()
            cmd = New SqlCommand("select pin_no,acc_no,name,balance from Login where pin_no='" & pin & "'and acc_no='" & acc & "'", con)
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