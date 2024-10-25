Public Class AdministracionPrestamos
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

    Protected Sub ImgBtnRegistrarPrestamo_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnRegistrarPrestamo.Click
        PanelControl.Visible = False
        PanelNuevoPrestamo.Visible = True
    End Sub

    Protected Sub BtnCancelarSubirPrestamo_Click(sender As Object, e As EventArgs) Handles BtnCancelarSubirPrestamo.Click
        PanelControl.Visible = True
        PanelNuevoPrestamo.Visible = False
        TxtSubirFechaFinPrestamo.Text = ""
        TxtSubirFechaInicioPrestamo.Text = ""
        DdlSubirLibroPestamo.ClearSelection()
        DdlSubirUsuarioPrestamo.ClearSelection()
    End Sub

    Protected Sub BtnSubirPrestamo_Click(sender As Object, e As EventArgs) Handles BtnSubirPrestamo.Click
        Dim camposVaciosPrestamo As Boolean = False

        If String.IsNullOrEmpty(DdlSubirUsuarioPrestamo.SelectedValue) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione un usuario para el préstamo.');", True)
            camposVaciosPrestamo = True
        ElseIf String.IsNullOrEmpty(DdlSubirLibroPestamo.SelectedValue) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione un libro para el préstamo.');", True)
            camposVaciosPrestamo = True
        ElseIf String.IsNullOrEmpty(TxtSubirFechaInicioPrestamo.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la fecha de préstamo.');", True)
            TxtSubirFechaInicioPrestamo.Focus()
            camposVaciosPrestamo = True
        ElseIf String.IsNullOrEmpty(TxtSubirFechaFinPrestamo.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la fecha de devolución.');", True)
            TxtSubirFechaFinPrestamo.Focus()
            camposVaciosPrestamo = True
        End If

        If Not camposVaciosPrestamo Then
            ' Si no hay campos vacíos, procede con la inserción de datos en la base de datos
            DS_SubirPrestamo.Insert()


            ' Registrando el script JavaScript para mostrar el mensaje
            Dim scriptPrestamo As String = "alert('Préstamo registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", scriptPrestamo, True)

            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        End If

    End Sub
    Protected Sub DdlFiltroPrestamos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlFiltroPrestamos.SelectedIndexChanged
        AplicarFiltro()
    End Sub

    Private Sub AplicarFiltro()
        Dim filtro As String = DdlFiltroPrestamos.SelectedValue

        Select Case filtro
            Case "Vencidos"
                DS_BuscarPrestamo.SelectCommand = "SELECT TB_Prestamos.ID_Prestamo, TB_Usuarios.N_Usuario, TB_Prestamos.NID_Libro, TB_Libros.N_Libro, TB_Prestamos.FechaPrestamo, TB_Prestamos.FechaDevolucion, CAT_EstadoPrestamo.N_Estado, TB_Prestamos.ID_Sancion FROM TB_Prestamos INNER JOIN TB_Usuarios ON TB_Prestamos.NID_Usuario = TB_Usuarios.ID_Usuario INNER JOIN TB_Libros ON TB_Prestamos.NID_Libro = TB_Libros.N_Serie INNER JOIN CAT_EstadoPrestamo ON TB_Prestamos.EstadoPrestamo = CAT_EstadoPrestamo.Nid_EstadoPrestamo WHERE TB_Prestamos.FechaDevolucion < GETDATE() AND TB_Prestamos.EstadoPrestamo = 1"
            Case "Atrasados"
                DS_BuscarPrestamo.SelectCommand = "SELECT TB_Prestamos.ID_Prestamo, TB_Usuarios.N_Usuario, TB_Prestamos.NID_Libro, TB_Libros.N_Libro, TB_Prestamos.FechaPrestamo, TB_Prestamos.FechaDevolucion, CAT_EstadoPrestamo.N_Estado, TB_Prestamos.ID_Sancion FROM TB_Prestamos INNER JOIN TB_Usuarios ON TB_Prestamos.NID_Usuario = TB_Usuarios.ID_Usuario INNER JOIN TB_Libros ON TB_Prestamos.NID_Libro = TB_Libros.N_Serie INNER JOIN CAT_EstadoPrestamo ON TB_Prestamos.EstadoPrestamo = CAT_EstadoPrestamo.Nid_EstadoPrestamo WHERE TB_Prestamos.FechaDevolucion = CONVERT(date, GETDATE()) AND TB_Prestamos.EstadoPrestamo = 1"
            Case Else ' General
                DS_BuscarPrestamo.SelectCommand = "SELECT TB_Prestamos.ID_Prestamo, TB_Usuarios.N_Usuario, TB_Prestamos.NID_Libro, TB_Libros.N_Libro, TB_Prestamos.FechaPrestamo, TB_Prestamos.FechaDevolucion, CAT_EstadoPrestamo.N_Estado, TB_Prestamos.ID_Sancion FROM TB_Prestamos INNER JOIN TB_Usuarios ON TB_Prestamos.NID_Usuario = TB_Usuarios.ID_Usuario INNER JOIN TB_Libros ON TB_Prestamos.NID_Libro = TB_Libros.N_Serie INNER JOIN CAT_EstadoPrestamo ON TB_Prestamos.EstadoPrestamo = CAT_EstadoPrestamo.Nid_EstadoPrestamo WHERE TB_Prestamos.EstadoPrestamo = 1"
        End Select

        GridView1.DataBind()
    End Sub

    Protected Sub BtnCerrarBuscarPrestamos_Click(sender As Object, e As EventArgs) Handles BtnCerrarBuscarPrestamos.Click
        PanelBuscarPrestamo.Visible = False
        PanelNuevoPrestamo.Visible = False
        PanelControl.Visible = True
    End Sub

    Protected Sub ImgBtnConsultarPrestamo_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnConsultarPrestamo.Click
        PanelBuscarPrestamo.Visible = True
        PanelNuevoPrestamo.Visible = False
        PanelControl.Visible = False
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        ' Obtén el ID del prestamo de la fila seleccionada
        Dim selectedPrestamoID As Integer = Convert.ToInt32(GridView2.SelectedDataKey.Value)

        ' Filtra los datos usando el ID del prestamo
        DS_ModificarPrestamo.SelectCommand = "SELECT * FROM [TB_Prestamos] WHERE ([ID_Prestamo] = @ID_Prestamo)"

        ' Establece el parámetro
        DS_ModificarPrestamo.SelectParameters.Clear()
        DS_ModificarPrestamo.SelectParameters.Add("ID_Prestamo", selectedPrestamoID.ToString())

        ' Realiza la consulta
        Dim dv As DataView = DirectCast(DS_ModificarPrestamo.Select(DataSourceSelectArguments.Empty), DataView)

        ' Verifica si hay datos y actualiza los campos del formulario
        If dv IsNot Nothing AndAlso dv.Count > 0 Then
            TxtModificarIdPrestamo.Text = dv.Table.Rows(0)("ID_Prestamo").ToString()
            DdlModificarUsuarioPrestamo.SelectedValue = dv.Table.Rows(0)("NID_Usuario").ToString()
            DdlModificarLibroPrestamo.SelectedValue = dv.Table.Rows(0)("NID_Libro").ToString()
            Dim fechaInicio As DateTime
            If DateTime.TryParse(dv.Table.Rows(0)("FechaDevolucion").ToString(), fechaInicio) Then
                TxtModificarFechaInicioPrestamo.Text = fechaInicio.ToString("yyyy-MM-dd")
            End If
            Dim fechaFin As DateTime
            If DateTime.TryParse(dv.Table.Rows(0)("FechaDevolucion").ToString(), fechaFin) Then
                TxtModificarFechaFinPrestamo.Text = fechaFin.ToString("yyyy-MM-dd")
            End If
            DdlModificarEstadoPrestamo.SelectedValue = dv.Table.Rows(0)("EstadoPrestamo").ToString()

            ' Muestra el panel de modificación
            PanelFormEditarPrestamo.Visible = True
        End If
    End Sub

    Protected Sub BtnCerrarModPrestamo_Click(sender As Object, e As EventArgs) Handles BtnCerrarModPrestamo.Click
        PanelFormEditarPrestamo.Visible = False
        TxtModificarIdPrestamo.Text = ""
        DdlModificarUsuarioPrestamo.ClearSelection()
        DdlModificarLibroPrestamo.ClearSelection()
        TxtModificarFechaInicioPrestamo.Text = ""
        TxtModificarFechaFinPrestamo.Text = ""
        DdlModificarEstadoPrestamo.ClearSelection()
    End Sub

    Protected Sub BtnActualizarPrestamo_Click(sender As Object, e As EventArgs) Handles BtnActualizarPrestamo.Click
        Dim camposVacios As Boolean = False
        If String.IsNullOrEmpty(TxtModificarFechaInicioPrestamo.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la contraseña.');", True)
            TxtModificarFechaInicioPrestamo.Focus()
            camposVacios = True
        End If
        If String.IsNullOrEmpty(TxtModificarFechaFinPrestamo.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la contraseña.');", True)
            TxtModificarFechaFinPrestamo.Focus()
            camposVacios = True
        End If

        If Not camposVacios Then
            DS_ModificarPrestamo.Update()
            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Usuario Modificado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
            GridView2.DataBind()
        End If
    End Sub

    Protected Sub ImgBtnEditarPrestamo_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnEditarPrestamo.Click
        PanelActualizarPrestamo.Visible = True
        PanelControl.Visible = False
        PanelBuscarPrestamo.Visible = False
        PanelNuevoPrestamo.Visible = False
    End Sub

    Protected Sub BtnCerrarModificacionPrestamos_Click(sender As Object, e As EventArgs) Handles BtnCerrarModificacionPrestamos.Click
        PanelActualizarPrestamo.Visible = False
        PanelControl.Visible = True
        PanelBuscarPrestamo.Visible = False
        PanelNuevoPrestamo.Visible = False
    End Sub
End Class