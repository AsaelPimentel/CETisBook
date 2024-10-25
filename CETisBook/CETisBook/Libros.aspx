<%@ Page Title="Buscar Libros" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Libros.aspx.vb" Inherits="CETisBook.Libros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section>
            <asp:Panel ID="PanelConsultaLibros" runat="server">
                <h2 class="text-center">Buscar libros</h2>
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
                            <asp:BoundField DataField="N_Descripcion" HeaderText="Descripcion" SortExpression="N_Descripcion" />
                            <asp:BoundField DataField="Expr1" HeaderText="Estado" SortExpression="Expr1" />
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
                            <asp:Button ID="BtnCerrarConsutaLibros" runat="server" Text="Ver todos los libros" CssClass="animacion btn btn-outline-primary" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </section>
    </main>
</asp:Content>
