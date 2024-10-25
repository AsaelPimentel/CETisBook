<%@ Page Title="Libros" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AdministracionLibros.aspx.vb" Inherits="CETisBook.AdministracionLibros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <asp:ImageButton ID="ImgBtnVolver" CssClass="rounded float-start cerrar" runat="server" Style="height: 50px; width: 50px;" ImageUrl="~/IMG/Volver.png" />
                </div>
                <div class="col-11">
                    <h1>Administracion de Libros.</h1>
                </div>
            </div>
        </div>
    </div>
    <asp:Panel ID="PanelControl" runat="server">
        <div class="container text-center">
            <div class="row row-cols-2">
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnRegistrarLibros" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/AñadirLibro.png" />
                    <div class="col">
                        <asp:Label ID="LblRegistrarLibros" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Registrar libros"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnConsultarLibros" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/BuscarLibro.png" />
                    <div class="col">
                        <asp:Label ID="LblConsultarLibros" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Consultar libros"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnEditarLibros" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/EditarLibro.png" />
                    <div class="col">
                        <asp:Label ID="LblEditarLibros" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Editar Libros"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelAltaLibros" runat="server" Visible="false">
        <h2 class="text-center">Agregar libros</h2>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirPortada" runat="server" Text="Portada del libro"></asp:Label>
                        <asp:FileUpload ID="FileUpPortada" CssClass="form-control" runat="server" PropertyName="FileBytes" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirTitulo" runat="server" Text="Nombre del libro"></asp:Label>
                        <asp:TextBox ID="TxtSubirTitulo" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirNobreAutor" runat="server" Text="Nombre del autor"></asp:Label>
                        <asp:TextBox ID="TxtSubirNombreAutor" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirGenero" runat="server" Text="Genero del libro"></asp:Label>
                        <asp:DropDownList ID="DdlSubirGeneroLinro" runat="server" CssClass="form-control" DataSourceID="DS_SubirGenero" DataTextField="N_Categoria" DataValueField="Nid_Categoria"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirGenero" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_Categorias]"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirEditorialLibro" runat="server" Text="Editorial del libro"></asp:Label>
                        <asp:TextBox ID="TxtSubirEditorialLibro" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirPublicacionLibro" runat="server" Text="Año de publicaion"></asp:Label>
                        <asp:TextBox ID="TxtSubirPublicacionLibro" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="LblSubirDescLibro" runat="server" Text="Descripcion del libro"></asp:Label>
                <asp:TextBox ID="TxtSubirDescLibro" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Width="100%"></asp:TextBox>
            </div>
            <div class="text-center form-group">
                <br />
                <asp:Button ID="BtnCerrarSubirLibro" runat="server" Text="Cerrar" CssClass="btn btn-outline-secondary animacion" />
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnSubirLibro" runat="server" Text="Registrar Libro" CssClass="btn btn-outline-success animacion" OnClick="BtnSubirLibro_Click" />
                <asp:SqlDataSource ID="DS_SubirLibro" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" InsertCommand="INSERT INTO TB_Libros(N_Portada, N_Libro, N_Autor, N_Genero, N_Editorial, N_Publicacion, N_Descripcion, N_Estado, N_FechaRegistro) VALUES (@portada, @nombre, @autor, @genero, @editorial, @publicaion, @descripcion, @estado, GETDATE())" SelectCommand="SELECT * FROM [TB_Libros]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="FileUpPortada" Name="portada" PropertyName="FileBytes" />
                        <asp:ControlParameter ControlID="TxtSubirTitulo" Name="nombre" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TxtSubirNombreAutor" Name="autor" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DdlSubirGeneroLinro" Name="genero" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TxtSubirEditorialLibro" Name="editorial" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TxtSubirPublicacionLibro" Name="publicaion" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TxtSubirDescLibro" Name="descripcion" PropertyName="Text" />
                        <asp:Parameter Name="estado" DefaultValue="1" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelConsultaLibros" runat="server" Visible="false">
        <h2 class="text-center">Consultar libros</h2>
        <div class="container text-center">
            <asp:SqlDataSource ID="DS_ConsultarLibrosTabla" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT TB_Libros.N_Serie, TB_Libros.N_Portada, TB_Libros.N_Libro, TB_Libros.N_Autor, CAT_Categorias.N_Categoria, TB_Libros.N_Editorial, TB_Libros.N_Publicacion, TB_Libros.N_Descripcion, CAT_EstadoLibro.N_Estado AS Expr1, TB_Libros.N_FechaRegistro FROM TB_Libros INNER JOIN CAT_EstadoLibro ON TB_Libros.N_Estado = CAT_EstadoLibro.Nid_Estado INNER JOIN CAT_Categorias ON TB_Libros.N_Genero = CAT_Categorias.Nid_Categoria"></asp:SqlDataSource>
            <div class="form-group input-group">
                <asp:TextBox ID="TxtFiltroLibros" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtFiltroLibros_TextChanged" placeholder="Buscar libros..."></asp:TextBox>
                <asp:Button ID="BtnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" />
            </div>
            <asp:GridView ID="GV_ConsultaLibros" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="N_Serie" DataSourceID="DS_ConsultarLibrosTabla" Width="100%">
                <Columns>
                    <asp:BoundField DataField="N_Serie" HeaderText="Numero de Serie" InsertVisible="False" ReadOnly="True" SortExpression="N_Serie" />
                    <asp:TemplateField HeaderText="Portada">
                        <ItemTemplate>
                            <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# "data:image/jpeg;base64," + Convert.ToBase64String(CType(Eval("N_Portada"), Byte())) %>' Width="100" Height="150" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="N_Libro" HeaderText="Nombre" SortExpression="N_Libro" />
                    <asp:BoundField DataField="N_Autor" HeaderText="Autor" SortExpression="N_Autor" />
                    <asp:BoundField DataField="N_Categoria" HeaderText="Categoria" SortExpression="N_Categoria" />
                    <asp:BoundField DataField="N_Editorial" HeaderText="Editorial" SortExpression="N_Editorial" />
                    <asp:BoundField DataField="N_Publicacion" HeaderText="año de Publicacion" SortExpression="N_Publicacion" />
                    <asp:BoundField DataField="N_Descripcion" HeaderText="Descripcion" SortExpression="N_Descripcion" />
                    <asp:BoundField DataField="Expr1" HeaderText="Estado" SortExpression="Expr1" />
                    <asp:BoundField DataField="N_FechaRegistro" HeaderText="Fecha de Registro" SortExpression="N_FechaRegistro" DataFormatString="{0:d}" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        </div>
        <div class="container text-center">
            <div class="row">
                <div class="col-md-12">
                    <br />
                    <asp:Button ID="BtnCerrarConsutaLibros" runat="server" Text="Cerrar" CssClass="animacion btn btn-outline-primary" />
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelEditarLibros" runat="server" Visible="false">
        <h2 class="text-center">Modificar libros</h2>
        <div class="container text-center">
            <asp:SqlDataSource ID="DS_ModificarLibrosGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT TB_Libros.N_Serie, TB_Libros.N_Portada, TB_Libros.N_Libro, TB_Libros.N_Autor, CAT_Categorias.N_Categoria, TB_Libros.N_Editorial, TB_Libros.N_Publicacion, TB_Libros.N_Descripcion, CAT_EstadoLibro.N_Estado AS Expr1, TB_Libros.N_FechaRegistro FROM TB_Libros INNER JOIN CAT_EstadoLibro ON TB_Libros.N_Estado = CAT_EstadoLibro.Nid_Estado INNER JOIN CAT_Categorias ON TB_Libros.N_Genero = CAT_Categorias.Nid_Categoria"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="N_Serie" DataSourceID="DS_ModificarLibrosGV" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="N_Serie" HeaderText="Numero de Serie" InsertVisible="False" ReadOnly="True" SortExpression="N_Serie" />
                    <asp:TemplateField HeaderText="Portada">
                        <ItemTemplate>
                            <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# "data:image/jpeg;base64," + Convert.ToBase64String(CType(Eval("N_Portada"), Byte())) %>' Width="100" Height="150" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="N_Libro" HeaderText="Nombre del Libro" SortExpression="N_Libro" />
                    <asp:BoundField DataField="N_Autor" HeaderText="Autor" SortExpression="N_Autor" />
                    <asp:BoundField DataField="N_Categoria" HeaderText="Categoria" SortExpression="N_Categoria" />
                    <asp:BoundField DataField="N_Editorial" HeaderText="Editorial" SortExpression="N_Editorial" />
                    <asp:BoundField DataField="N_Publicacion" HeaderText="Año de Publicacion" SortExpression="N_Publicacion" />
                    <asp:BoundField DataField="N_Descripcion" HeaderText="N_Descripcion" SortExpression="N_Descripcion" />
                    <asp:BoundField DataField="Expr1" HeaderText="Estado" SortExpression="Expr1" />
                    <asp:BoundField DataField="N_FechaRegistro" HeaderText="Fecha de Registro" SortExpression="N_FechaRegistro" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <br />
            <asp:Button ID="BtnCancelarModLibro" runat="server" CssClass="animacion btn btn-success" Text="Cerrar" />
            <br />
            <asp:SqlDataSource ID="DS_ModLibros" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [TB_Libros] WHERE ([N_Serie] = @N_Serie)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Aux" Name="N_Serie" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="row">
                <div class="col">

                    <br />
                    <asp:Label ID="Aux" runat="server"></asp:Label>

                </div>
                <div class="col">
                    <asp:Panel ID="PnlFormEditarLibro" runat="server" Visible="false">
                        <h4 class="text-center">Modifcar Registro de libro</h4>
                        <div class="container text-center">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="LblSNModLibro" runat="server" Text="Numero de serie"></asp:Label>
                                        <asp:TextBox ID="TxtSNModLibro" CssClass="form-control" runat="server" TextMode="Number" Enabled="False"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-12">
                                        <asp:Label ID="LblModPortadaLibro" runat="server" Text="Cambiar la Portada del libro"></asp:Label>
                                        <asp:FileUpload ID="FileUpModPortadaLibro" CssClass="form-control" runat="server" PropertyName="FileBytes" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="LblModTitulo" runat="server" Text="Nombre del libro"></asp:Label>
                                        <asp:TextBox ID="TxtModTituloLibro" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="LblModNomAutorLibro" runat="server" Text="Nombre del autor"></asp:Label>
                                        <asp:TextBox ID="TxtModNomAutorLibro" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="LblModCategoriaLibro" runat="server" Text="Categoria del libro"></asp:Label>
                                        <asp:DropDownList ID="DdlModGeneroLibro" CssClass="form-select" runat="server" DataSourceID="DS_ModCategoriaLibro" DataTextField="N_Categoria" DataValueField="Nid_Categoria" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_ModCategoriaLibro" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_Categorias]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="LblModEditorialLibro" runat="server" Text="Editorial"></asp:Label>
                                        <asp:TextBox ID="TxtModEditorialLibro" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="LblModPublicaionLibro" runat="server" Text="Año de publicacion"></asp:Label>
                                        <asp:TextBox ID="TxtModPublicacionLibro" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="LblModDescLibro" runat="server" Text="Decripcion del libro"></asp:Label>
                                        <asp:TextBox ID="TxtModDescLibro" CssClass="form-control" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="LblModEstadoLibro" runat="server" Text="Estado del libro"></asp:Label>
                                    <asp:DropDownList ID="DdlModEstadoLibro" CssClass="form-select" runat="server" DataSourceID="DS_ModEstadoLibro" DataTextField="N_Estado" DataValueField="Nid_Estado"></asp:DropDownList>
                                    <asp:SqlDataSource ID="DS_ModEstadoLibro" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_EstadoLibro]"></asp:SqlDataSource>
                                    <br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <br />
                                    <asp:Button ID="BtnCacelarModificacionLibro" runat="server" Text="Cancelar" CssClass="animacion btn btn-info" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="BtnModificarLibro" runat="server" CssClass="animacion btn btn-warning" Text="Modificar libro" />
                                    <asp:SqlDataSource ID="DS_ActualizarLibro" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [TB_Libros]" UpdateCommand="UPDATE TB_Libros SET N_Portada = @img, N_Libro = @nom, N_Autor = @aut, N_Genero = @gen, N_Editorial = @edit, N_Publicacion = @year, N_Descripcion = @desc , N_Estado = @esta WHERE (N_Serie = @serie)">
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="FileUpModPortadaLibro" Name="img" PropertyName="FileBytes" />
                                            <asp:ControlParameter ControlID="TxtModTituloLibro" Name="nom" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="TxtModNomAutorLibro" Name="aut" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="DdlModGeneroLibro" Name="gen" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="TxtModEditorialLibro" Name="edit" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="TxtModPublicacionLibro" Name="year" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="TxtModDescLibro" Name="desc" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="DdlModEstadoLibro" Name="esta" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="TxtSNModLibro" Name="serie" PropertyName="Text" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
