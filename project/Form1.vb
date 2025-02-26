Imports System.Data.SqlClient
Public Class Form1
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim ds As DataSet
    Dim da As SqlDataAdapter
    Dim maxat As Integer
    Private Sub Label3_Click(sender As Object, e As EventArgs) Handles Label3.Click
        Me.Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim pin As Integer
        Dim acc As Integer
        pin = Val(txtpin.Text)
        acc = Val(txtacc.Text)
        If txtpin.Text = "" Then
            MessageBox.Show("please enter the pin")
            txtpin.Focus()
        ElseIf txtacc.Text = "" Then
            MessageBox.Show("please enter the Account number")
            txtacc.Focus()
        Else
            Try
                con = New SqlConnection("Data Source=JKWORLD\SQLEXPRESS2; Initial Catalog=atm; Integrated Security=True")
                con.Open()
                cmd = New SqlCommand("select pin_no,acc_no,name,balance from Login where pin_no='" & pin & "'and acc_no='" & acc & "'", con)
                dr = cmd.ExecuteReader
                If dr.Read Then
                    
                    Me.Hide()
                    Form2.ShowDialog()

                Else
                    MessageBox.Show("account does not exist!!!!!", "error!", MessageBoxButtons.OK, MessageBoxIcon.Error)

                End If
                
            Catch ex As Exception
                MessageBox.Show(ex.Message)
                
            End Try
            
        End If

    End Sub

    Private Sub LinkLabel1_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        maxat = maxat + 1
        If maxat < 3 Then
            Form3.Show()
        Else
            MessageBox.Show("maximum attempts exceeded", "error!", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Me.Close()
        End If
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub
End Class