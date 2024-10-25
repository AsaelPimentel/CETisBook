Public Class AdministracionReportes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SessionVerification.VerifyAdminSession()
    End Sub

    Protected Sub ImgBtnVolver_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnVolver.Click
        Response.Redirect("Administracion.aspx")
    End Sub
End Class