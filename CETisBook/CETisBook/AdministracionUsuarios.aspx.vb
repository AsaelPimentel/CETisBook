Public Class AdministracionUsuarios
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

    Protected Sub ImgBtnRegistrarUsuarios_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnRegistrarUsuarios.Click
        PanelSubirUsuarios.Visible = True
        PanelConsultarUsuarios.Visible = False
        PanelControl.Visible = False
    End Sub

    Protected Sub BtnSubirUsuario_Click(sender As Object, e As EventArgs) Handles BtnSubirUsuario.Click
        Dim camposVacios As Boolean = False

        If String.IsNullOrEmpty(TxtSubirNombreUsuario.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el nombre de usuario.');", True)
            TxtSubirNombreUsuario.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirPasswordUsuario.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la contraseña.');", True)
            TxtSubirPasswordUsuario.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirMailUsuario.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el correo electrónico.');", True)
            TxtSubirMailUsuario.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(DdlSubirRolUsuario.SelectedValue) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione el rol de usuario.');", True)
            DdlSubirRolUsuario.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(DdlSubirPersonaUsuario.SelectedValue) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione la persona asociada al usuario.');", True)
            DdlSubirPersonaUsuario.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(DdlSubirEstadoUsuario.SelectedValue) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione el estado del usuario.');", True)
            DdlSubirEstadoUsuario.Focus()
            camposVacios = True
        End If

        If Not camposVacios Then
            ' Si no hay campos vacíos, procede con la inserción de datos en la base de datos
            DS_SubirUsuario.Insert()
            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Usuario registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        End If

    End Sub

    Protected Sub BtnCerrarConsultaUsuarios_Click(sender As Object, e As EventArgs) Handles BtnCerrarConsultaUsuarios.Click
        PanelSubirUsuarios.Visible = False
        PanelConsultarUsuarios.Visible = False
        PanelControl.Visible = True
    End Sub

    Protected Sub ImgBtnConsultarUsuarios_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnConsultarUsuarios.Click
        PanelSubirUsuarios.Visible = False
        PanelConsultarUsuarios.Visible = True
        PanelControl.Visible = False
    End Sub

    Protected Sub GVModificarUser_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVModificarUser.SelectedIndexChanged
        ' Obtén el ID del usuario de la fila seleccionada
        Dim selectedUserID As Integer = Convert.ToInt32(GVModificarUser.SelectedDataKey.Value)

        ' Filtra los datos usando el ID del usuario
        DS_ModificarUsuario.SelectCommand = "SELECT * FROM [TB_Usuarios] WHERE ([ID_Usuario] = @ID_Usuario)"

        ' Establece el parámetro
        DS_ModificarUsuario.SelectParameters.Clear()
        DS_ModificarUsuario.SelectParameters.Add("ID_Usuario", selectedUserID.ToString())

        ' Realiza la consulta
        Dim dv As DataView = DirectCast(DS_ModificarUsuario.Select(DataSourceSelectArguments.Empty), DataView)

        ' Verifica si hay datos y actualiza los campos del formulario
        If dv IsNot Nothing AndAlso dv.Count > 0 Then
            TxtModifcarIDUsuario.Text = dv.Table.Rows(0)("ID_Usuario").ToString()
            TxtModificarNombreUsuario.Text = dv.Table.Rows(0)("N_Usuario").ToString()
            TxtModificarPasswordUsuario.Text = dv.Table.Rows(0)("N_Password").ToString()
            TxtModificarMailUsuario.Text = dv.Table.Rows(0)("N_Mail").ToString()
            DdlModificarRolUsuario.SelectedValue = dv.Table.Rows(0)("N_Rol").ToString()
            ' Ajusta los demás campos según tu estructura de datos
            ' Muestra la fecha en el formato del campo
            Dim fechaRegistro As DateTime
            If DateTime.TryParse(dv.Table.Rows(0)("N_FechaRegistro").ToString(), fechaRegistro) Then
                TxtModificarFechaRegistro.Text = fechaRegistro.ToString("yyyy-MM-dd")
            End If
            ' ... y así sucesivamente para los demás campos
            DdlModificarEstadoUsuario.SelectedValue = dv.Table.Rows(0)("N_EstadoUsuario").ToString()
        End If

        ' Muestra el panel de modificación
        PanelFromEditarUsuario.Visible = True
    End Sub

    Protected Sub ImgBtnEditarUsuarios_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnEditarUsuarios.Click
        PanelSubirUsuarios.Visible = False
        PanelConsultarUsuarios.Visible = False
        PanelControl.Visible = False
        PanelEditarUsuarios.Visible = True
    End Sub

    Protected Sub BtnCacelarModificacionLibro_Click(sender As Object, e As EventArgs) Handles BtnCacelarModificacionLibro.Click
        PanelFromEditarUsuario.Visible = False
        TxtModifcarIDUsuario.Text = ""
        TxtModificarNombreUsuario.Text = ""
        TxtModificarPasswordUsuario.Text = ""
        TxtModificarMailUsuario.Text = ""
        TxtModificarFechaRegistro.Text = ""
        DdlModificarRolUsuario.ClearSelection()
        DdlModificarPersonaUsuario.ClearSelection()
        DdlModificarEstadoUsuario.ClearSelection()
    End Sub

    Protected Sub BtnModificarLibro_Click(sender As Object, e As EventArgs) Handles BtnModificarLibro.Click
        Dim camposVacios As Boolean = False
        If String.IsNullOrEmpty(TxtModificarPasswordUsuario.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la contraseña.');", True)
            TxtModificarPasswordUsuario.Focus()
            camposVacios = True
        End If

        If Not camposVacios Then
            DS_ActualizarUsuario.Update()
            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Usuario Modificado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
            GVModificarUser.DataBind()
        End If
    End Sub

    Protected Sub BtnCerrarModificaciones_Click(sender As Object, e As EventArgs) Handles BtnCerrarModificaciones.Click
        PanelControl.Visible = True
        PanelConsultarUsuarios.Visible = False
        PanelEditarUsuarios.Visible = False
        PanelSubirUsuarios.Visible = False
    End Sub
End Class