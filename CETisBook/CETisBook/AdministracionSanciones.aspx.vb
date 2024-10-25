Public Class AdministracionSanciones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SessionVerification.VerifyAdminSession()
    End Sub

    Protected Sub ImgBtnVolver_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnVolver.Click
        Response.Redirect("Administracion.aspx")
    End Sub

    Protected Sub BtnCancelarSubirSancion_Click(sender As Object, e As EventArgs) Handles BtnCancelarSubirSancion.Click
        PanelNuevaSancion.Visible = False
        PanelControl.Visible = True
    End Sub

    Protected Sub ImgBtnRegistrarSanciones_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnRegistrarSanciones.Click
        PanelControl.Visible = False
        PanelNuevaSancion.Visible = True
    End Sub

    Protected Sub BtnSubirSancion_Click(sender As Object, e As EventArgs) Handles BtnSubirSancion.Click
        Dim camposVaciosPrestamo As Boolean = False

        If String.IsNullOrEmpty(TxtSubirMotivoSancion.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Inserte un motivo para la sancion.');", True)
            camposVaciosPrestamo = True
        ElseIf String.IsNullOrEmpty(TxtSubriCastigoSancion.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Inserte un castigo para la sancion.');", True)
            camposVaciosPrestamo = True
        End If

        If Not camposVaciosPrestamo Then
            ' Si no hay campos vacíos, procede con la inserción de datos en la base de datos
            DS_InsertSancion.Insert()
            DS_InsertSancion.Update()

            ' Registrando el script JavaScript para mostrar el mensaje
            Dim scriptPrestamo As String = "alert('Sancion registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", scriptPrestamo, True)

            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        End If

    End Sub

    Protected Sub ImgBtnConsultarSanciones_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnConsultarSanciones.Click
        PanelConsultarSanciones.Visible = True
        PanelControl.Visible = False
        PanelNuevaSancion.Visible = False
    End Sub

    Protected Sub BtnCerrarConsultas_Click(sender As Object, e As EventArgs) Handles BtnCerrarConsultas.Click
        PanelConsultarSanciones.Visible = False
        PanelNuevaSancion.Visible = False
        PanelControl.Visible = True
    End Sub

    Protected Sub ImgBtnEditarSancion_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnEditarSancion.Click
        PanelActualizarSancion.Visible = True
        PanelControl.Visible = False
        PanelConsultarSanciones.Visible = False
        PanelNuevaSancion.Visible = False
    End Sub

    Protected Sub BtnCerrarModificacionSancion_Click(sender As Object, e As EventArgs) Handles BtnCerrarModificacionSancion.Click
        PanelActualizarSancion.Visible = False
        PanelControl.Visible = True
        PanelConsultarSanciones.Visible = False
        PanelNuevaSancion.Visible = False
    End Sub

    Protected Sub BtnCerrarModSancion_Click(sender As Object, e As EventArgs) Handles BtnCerrarModSancion.Click
        PanelFromEditarSancion.Visible = False
        TxtModIdSancion.Text = ""
        TxtModFechaSancion.Text = ""
        TxtModSancion.Text = ""
        TxtModMotivoSancion.Text = ""
        DdlModEstadoSancion.ClearSelection()
        DdlModPrestamoSancion.ClearSelection()
        DdlModUserSancion.ClearSelection()
    End Sub

    Protected Sub GridViewSanciones_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewSanciones.SelectedIndexChanged
        ' Obtén el ID de la sanción de la fila seleccionada
        Dim selectedSancionID As Integer = Convert.ToInt32(GridViewSanciones.SelectedDataKey.Value)

        ' Filtra los datos usando el ID de la sanción
        DS_ModificarSancion.SelectCommand = "SELECT * FROM [TB_Sanciones] WHERE ([ID_Sancion] = @ID_Sancion)"

        ' Establece el parámetro
        DS_ModificarSancion.SelectParameters.Clear()
        DS_ModificarSancion.SelectParameters.Add("ID_Sancion", selectedSancionID.ToString())

        ' Realiza la consulta
        Dim dvSancion As DataView = DirectCast(DS_ModificarSancion.Select(DataSourceSelectArguments.Empty), DataView)

        ' Verifica si hay datos y actualiza los campos del formulario
        If dvSancion IsNot Nothing AndAlso dvSancion.Count > 0 Then
            TxtModIdSancion.Text = dvSancion.Table.Rows(0)("ID_Sancion").ToString()
            DdlModUserSancion.SelectedValue = dvSancion.Table.Rows(0)("Nid_Usuario").ToString()
            DdlModPrestamoSancion.SelectedValue = dvSancion.Table.Rows(0)("Nid_Prestamo").ToString()
            Dim fechaSancion As DateTime
            If DateTime.TryParse(dvSancion.Table.Rows(0)("N_FechaSancion").ToString(), fechaSancion) Then
                TxtModFechaSancion.Text = fechaSancion.ToString("yyyy-MM-dd")
            End If
            TxtModMotivoSancion.Text = dvSancion.Table.Rows(0)("N_Motivo").ToString()
            DdlModEstadoSancion.SelectedValue = dvSancion.Table.Rows(0)("N_EstadoSancion").ToString()
            TxtModSancion.Text = dvSancion.Table.Rows(0)("N_Sancion").ToString()

            ' Muestra el panel de modificación
            PanelFromEditarSancion.Visible = True
        End If
    End Sub

    Protected Sub BtnActualizarSancion_Click(sender As Object, e As EventArgs) Handles BtnActualizarSancion.Click
        Dim selectedSancionID As Integer = Convert.ToInt32(GridViewSanciones.SelectedDataKey.Value)
        Dim camposVacios As Boolean = False
        If String.IsNullOrEmpty(TxtModFechaSancion.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la fecha de aplicación de la sanción.');", True)
            TxtModFechaSancion.Focus()
            camposVacios = True
        End If
        If String.IsNullOrEmpty(TxtModMotivoSancion.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el motivo de la sanción.');", True)
            TxtModMotivoSancion.Focus()
            camposVacios = True
        End If
        If String.IsNullOrEmpty(TxtModSancion.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la sanción a cumplirse.');", True)
            TxtModSancion.Focus()
            camposVacios = True
        End If
        If Not camposVacios Then
            ' Actualiza los datos en la base de datos
            DS_ModificarSancion.Update()

            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Sanción actualizada correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)

            ' Redirige después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
            GridViewSanciones.DataBind()
        End If
    End Sub
End Class