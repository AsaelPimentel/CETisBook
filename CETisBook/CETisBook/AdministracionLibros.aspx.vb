Imports System.Data.SqlClient
Imports System.Configuration


Public Class AdministracionLibros
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

    Protected Sub ImgBtnRegistrarLibros_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnRegistrarLibros.Click
        'panel a mostrar
        PanelAltaLibros.Visible = True
        'paneles a cerrar
        PanelControl.Visible = False
        PanelConsultaLibros.Visible = False
        PanelEditarLibros.Visible = False
    End Sub

    Protected Sub BtnCerrarSubirLibro_Click(sender As Object, e As EventArgs) Handles BtnCerrarSubirLibro.Click
        'panel a mostrar
        PanelControl.Visible = True
        'paneles a cerrar
        PanelAltaLibros.Visible = False
        PanelConsultaLibros.Visible = False
        PanelEditarLibros.Visible = False
    End Sub

    Protected Sub BtnSubirLibro_Click(sender As Object, e As EventArgs) Handles BtnSubirLibro.Click
        Dim camposVacios As Boolean = False

        If FileUpPortada.HasFile AndAlso FileUpPortada.PostedFile.ContentLength > 0 Then
            ' El archivo se ha seleccionado y tiene contenido
        Else
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione una portada para el libro.');", True)
            camposVacios = True
        End If

        If String.IsNullOrEmpty(TxtSubirTitulo.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el nombre del libro.');", True)
            TxtSubirTitulo.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirNombreAutor.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el nombre del autor del libro.');", True)
            TxtSubirNombreAutor.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(DdlSubirGeneroLinro.SelectedValue) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione el género del libro.');", True)
            DdlSubirGeneroLinro.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirEditorialLibro.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la editorial del libro.');", True)
            TxtSubirEditorialLibro.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirPublicacionLibro.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el año de publicación del libro.');", True)
            TxtSubirPublicacionLibro.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirDescLibro.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la descripción del libro.');", True)
            TxtSubirDescLibro.Focus()
            camposVacios = True
        End If

        If Not camposVacios Then
            ' Si no hay campos vacíos, procede con la inserción de datos en la base de datos
            DS_SubirLibro.Insert()
            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Libro registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        End If

    End Sub

    Protected Sub ImgBtnConsultarLibros_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnConsultarLibros.Click
        'panel a mostrar
        PanelConsultaLibros.Visible = True
        'paneles a cerrar
        PanelControl.Visible = False
        PanelAltaLibros.Visible = False
        PanelEditarLibros.Visible = False
    End Sub

    Protected Sub ImgBtnVolver_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnVolver.Click
        Response.Redirect("Administracion.aspx")
    End Sub

    Protected Sub BtnCerrarConsutaLibros_Click(sender As Object, e As EventArgs) Handles BtnCerrarConsutaLibros.Click
        'panel a mostrar
        PanelControl.Visible = True
        'paneles a cerrar
        PanelConsultaLibros.Visible = False
        PanelAltaLibros.Visible = False
        PanelEditarLibros.Visible = False
    End Sub
    Protected Sub TxtFiltroLibros_TextChanged(sender As Object, e As EventArgs) Handles TxtFiltroLibros.TextChanged
        FiltrarLibros(TxtFiltroLibros.Text)
    End Sub

    Protected Sub BtnBuscar_Click(sender As Object, e As EventArgs)
        FiltrarLibros(TxtFiltroLibros.Text)
    End Sub

    Private Sub FiltrarLibros(filtro As String)
        ' Realiza la búsqueda y filtra los libros en la GridView
        DS_ConsultarLibrosTabla.SelectCommand = "SELECT TB_Libros.N_Serie, TB_Libros.N_Portada, TB_Libros.N_Libro, TB_Libros.N_Autor, CAT_Categorias.N_Categoria, TB_Libros.N_Editorial, TB_Libros.N_Publicacion, TB_Libros.N_Descripcion, CAT_EstadoLibro.N_Estado AS Expr1, TB_Libros.N_FechaRegistro FROM TB_Libros INNER JOIN CAT_EstadoLibro ON TB_Libros.N_Estado = CAT_EstadoLibro.Nid_Estado INNER JOIN CAT_Categorias ON TB_Libros.N_Genero = CAT_Categorias.Nid_Categoria WHERE TB_Libros.N_Libro LIKE '%' + @filtro + '%'"
        DS_ConsultarLibrosTabla.SelectParameters.Clear()
        DS_ConsultarLibrosTabla.SelectParameters.Add("filtro", filtro)
        GV_ConsultaLibros.DataBind()
    End Sub

    Protected Sub ImgBtnEditarLibros_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnEditarLibros.Click
        PanelEditarLibros.Visible = True
        PanelConsultaLibros.Visible = False
        PanelAltaLibros.Visible = False
        PanelControl.Visible = False
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ' Obtén el número de serie de la fila seleccionada
        Dim selectedN_Serie As Integer = Convert.ToInt32(GridView1.SelectedDataKey.Value)

        ' Filtra los datos usando el número de serie
        DS_ModLibros.SelectCommand = "SELECT * FROM [TB_Libros] WHERE [N_Serie] = @N_Serie"
        DS_ModLibros.SelectParameters.Clear()
        DS_ModLibros.SelectParameters.Add("N_Serie", selectedN_Serie.ToString())

        ' Realiza la consulta
        Dim dv As DataView = DirectCast(DS_ModLibros.Select(DataSourceSelectArguments.Empty), DataView)

        ' Verifica si hay datos y actualiza los campos del formulario
        If dv IsNot Nothing AndAlso dv.Count > 0 Then
            TxtSNModLibro.Text = dv.Table.Rows(0)("N_Serie").ToString()
            TxtModTituloLibro.Text = dv.Table.Rows(0)("N_Libro").ToString()
            TxtModNomAutorLibro.Text = dv.Table.Rows(0)("N_Autor").ToString()
            DdlModGeneroLibro.SelectedValue = dv.Table.Rows(0)("N_Genero").ToString()
            TxtModEditorialLibro.Text = dv.Table.Rows(0)("N_Editorial").ToString()
            TxtModPublicacionLibro.Text = dv.Table.Rows(0)("N_Publicacion").ToString()
            TxtModDescLibro.Text = dv.Table.Rows(0)("N_Descripcion").ToString()
            DdlModEstadoLibro.SelectedValue = dv.Table.Rows(0)("N_Estado").ToString()
        End If

        ' Muestra el panel de modificación
        PnlFormEditarLibro.Visible = True
    End Sub

    Protected Sub BtnCacelarModificacionLibro_Click(sender As Object, e As EventArgs) Handles BtnCacelarModificacionLibro.Click
        PnlFormEditarLibro.Visible = False
        TxtSNModLibro.Text = ""
        TxtModTituloLibro.Text = ""
        TxtModNomAutorLibro.Text = ""
        DdlModGeneroLibro.ClearSelection()
        TxtModEditorialLibro.Text = ""
        TxtModPublicacionLibro.Text = ""
        TxtModDescLibro.Text = ""
        DdlModEstadoLibro.ClearSelection()
    End Sub

    Protected Sub BtnModificarLibro_Click(sender As Object, e As EventArgs) Handles BtnModificarLibro.Click
        ' Check if the file upload control has a file and content length
        If FileUpModPortadaLibro.HasFile AndAlso FileUpModPortadaLibro.PostedFile.ContentLength > 0 Then
            ' File is selected and has content
        Else
            ' Show an alert and return if the file is not selected
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione una portada para el libro.');", True)
            Return
        End If
        ' Update the record in the database
        DS_ActualizarLibro.Update()

        ' Show a success message
        Dim script As String = "alert('Libro actualizado correctamente.');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        ' Redirect if needed
        Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        GridView1.DataBind()
    End Sub

    Protected Sub BtnCancelarModLibro_Click(sender As Object, e As EventArgs) Handles BtnCancelarModLibro.Click
        PanelEditarLibros.Visible = False
        PanelConsultaLibros.Visible = False
        PanelAltaLibros.Visible = False
        PanelControl.Visible = True
    End Sub
End Class