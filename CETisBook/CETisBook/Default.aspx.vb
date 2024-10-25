Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("Admin") = "1" Then
            ' Muestra contenido para el rol "Admin"
            PnlAdmin.Visible = True
        ElseIf Session("User") = "1" Then
            ' Muestra contenido para el rol "User" (otros usuarios)
            PnlAdmin.Visible = False
        Else
            ' Comprueba si el mensaje ya se mostró
            If Session("AlertShown") Is Nothing Then
                ' Registrando el script JavaScript para mostrar el mensaje
                Dim script As String = "alert('No tienes una sesión activa. Serás redirigido a la página de inicio de sesión.'); window.location.href = 'Login.aspx';"
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
                ' Establece una variable de sesión para indicar que el mensaje ya se mostró
                Session("AlertShown") = True
            End If
        End If
    End Sub

    Protected Sub BtnPanelControl_Click(sender As Object, e As EventArgs) Handles BtnPanelControl.Click
        Response.Redirect("Administracion.aspx")
    End Sub
End Class