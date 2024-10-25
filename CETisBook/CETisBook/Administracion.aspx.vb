Public Class Administracion
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

    Protected Sub ImgBtnLibros_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnLibros.Click
        Response.Redirect("AdministracionLibros.aspx")
    End Sub

    Protected Sub ImgBtnPrestamos_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnPrestamos.Click
        Response.Redirect("AdministracionPrestamos.aspx")
    End Sub

    Protected Sub ImgBtnSanciones_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnSanciones.Click
        Response.Redirect("AdministracionSanciones.aspx")
    End Sub

    Protected Sub ImgBtnInventario_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnInventario.Click
        Response.Redirect("AdministracionInventario.aspx")
    End Sub

    Protected Sub ImgBtnUsuarios_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnUsuarios.Click
        Response.Redirect("AdministracionUsuarios.aspx")
    End Sub

    Protected Sub ImgBtnReportes_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnReportes.Click
        Response.Redirect("AdministracionReportes.aspx")
    End Sub
End Class