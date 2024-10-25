Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("Admin") = "1" Then
            ' Si la variable de sesión "Admin" está presente, muestra el botón de administrador y oculta el botón de usuario
            ImgBtnLogoutAdmin.Visible = True
            ImgBtnLogoutUser.Visible = False
        Else Session("User") = "1" 
            ' Si la variable de sesión "User" está presente, muestra el botón de usuario y oculta el botón de administrador
            ImgBtnLogoutAdmin.Visible = False
            ImgBtnLogoutUser.Visible = True
        End If
    End Sub

    Protected Sub ImgBtnLogoutAdmin_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnLogoutAdmin.Click
        Session.Abandon()
        Session.Remove("Admin")
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub ImgBtnLogoutUser_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnLogoutUser.Click
        Session.Abandon()
        Session.Remove("User")
        Response.Redirect("Login.aspx")
    End Sub
End Class