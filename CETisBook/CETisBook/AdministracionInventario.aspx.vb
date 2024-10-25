Public Class AdministracionInventario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SessionVerification.VerifyAdminSession()
        If Session("Admin") IsNot Nothing Then
            ' Obtiene el valor de la variable de sesión "Admin"
            Dim rol As String = Session("Admin").ToString()

            ' Verifica si el Admin es "1" (o cualquier otro valor de cadena que tenga acceso)
            If rol <> "1" Then
                ' Redirige a una página de acceso no autorizado o realiza alguna otra acción
                Response.Redirect("Default.aspx")
            End If
        Else
            ' Si la variable de sesión "Admin" no existe, redirige a una página de acceso no autorizado
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub ImgBtnVolver_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnVolver.Click
        Response.Redirect("Administracion.aspx")
    End Sub
End Class