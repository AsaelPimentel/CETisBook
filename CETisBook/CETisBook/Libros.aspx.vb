Public Class Libros
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

    Protected Sub BtnCerrarConsutaLibros_Click(sender As Object, e As EventArgs) Handles BtnCerrarConsutaLibros.Click
        ' Realiza la redirección
        Response.Redirect(Request.RawUrl)

        ' Restablece la consulta general de la GridView
        GV_ConsultaLibros.DataSourceID = "DS_BuscarPrestamo"
        GV_ConsultaLibros.DataBind()
    End Sub
End Class