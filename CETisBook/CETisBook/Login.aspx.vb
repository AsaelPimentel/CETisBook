Public Class Login
    Inherits System.Web.UI.Page
    Dim bandera As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView = DirectCast(DS_Registrar.Select(DataSourceSelectArguments.Empty), DataView)
        If dv IsNot Nothing And dv.Count <> 0 Then
            For x As Integer = 0 To dv.Count - 1
                If dv.Table.Rows(x)(1).ToString = "Admin" Then
                    bandera = 1
                End If
            Next
            If bandera = 1 Then
                BtnRegAdmin.Visible = False
            Else
                BtnRegAdmin.Visible = True
            End If
        End If
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If txtUsername.Text = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showAlert('Por favor ingrese su usuario');", True) 'se muestra el modal de alerta
            txtUsername.Focus() 'resaltamos el campo
            txtUsername.Text = "" ' limpiamos la informacion del campo
            txtPassword.Text = "" ' limpiamos la informacion del campo
        ElseIf txtPassword.Text = "" Then
            'se muestra el modal de alerta
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showAlert('Por favor ingrese su contraseña');", True)
            txtPassword.Focus() 'resaltamos el campo
            txtUsername.Text = "" ' limpiamos la informacion del campo
            txtPassword.Text = "" ' limpiamos la informacion del campo
        Else
            Dim dv As DataView = DirectCast(DS_Login.Select(DataSourceSelectArguments.Empty), DataView) 'creacion de la variable de la consulta
            If dv IsNot Nothing And dv.Count <> 0 Then 'creacion de la validacion
                If dv.Table.Rows(0)(1).ToString = "Admin" Then
                    Session("Admin") = "1"
                    Response.Redirect("Default.aspx")
                Else
                    Session("User") = "1"
                    Response.Redirect("Default.aspx")
                End If
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showAlert('El usuario y/o contraseña incorrectos.');", True)
                txtUsername.Text = "" ' limpiamos la informacion del campo
                txtPassword.Text = "" ' limpiamos la informacion del campo
            End If
        End If
    End Sub

    Protected Sub BtnRegAdmin_Click(sender As Object, e As EventArgs) Handles BtnRegAdmin.Click
        PnlRegAdmin.Visible = True
        login.Visible = False
    End Sub

    Protected Sub BtnCancelar_Click(sender As Object, e As EventArgs) Handles BtnCancelar.Click
        PnlRegAdmin.Visible = False
        login.Visible = True
    End Sub

    Protected Sub BtnRegistrar_Click(sender As Object, e As EventArgs) Handles BtnRegistrar.Click
        DS_Registrar.Insert()
        ' Registrando el script JavaScript para mostrar el mensaje
        Dim script As String = "alert('Usuario administrador registrado correctamente.');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        ' Redirigir después del mensaje
        Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
    End Sub
End Class