<%@ Page Title="Sanciones" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AdministracionSanciones.aspx.vb" Inherits="CETisBook.AdministracionSanciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .textbox-center {
            margin: 0 auto;
        }
    </style>
    <main>
        <section>
            <div class="container">
                <div class="container text-center">
                    <div class="row">
                        <div class="col">
                            <asp:ImageButton ID="ImgBtnVolver" CssClass="rounded float-start cerrar" runat="server" Style="height: 50px; width: 50px;" ImageUrl="~/IMG/Volver.png" />
                        </div>
                        <div class="col-11">
                            <h1>Administracion de Sanciones.</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <asp:Panel ID="PanelControl" runat="server">
        <div class="container text-center">
            <div class="row row-cols-2">
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnRegistrarSanciones" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/agregarSancion.png" />
                    <div class="col">
                        <asp:Label ID="LblRegistrarSancion" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nueva Sancion"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnConsultarSanciones" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/ConsultarSancion.png" />
                    <div class="col">
                        <asp:Label ID="LblConsultarSanciones" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Consultar Sanciones"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnEditarSancion" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/EditarSancion.png" />
                    <div class="col">
                        <asp:Label ID="LblEditarSanciones" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Editar Sanciones"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="PanelNuevaSancion" runat="server" Visible="false" CssClass="text-center mt-3">
        <h2>Poner una <u>Sancion</u> a un Usuario</h2>
        <div class="container">
            <div class="container">
                <div class="form-group mx-auto">
                    <asp:Label ID="LblSubirUsuarioSancion" runat="server" Text="Usuario a sancionar"></asp:Label>
                    <asp:DropDownList ID="DdlSubirUsuarioSancion" CssClass="form-select textbox-center" runat="server" DataSourceID="DS_SubirUsuarioSancion" DataTextField="N_Usuario" DataValueField="ID_Usuario"></asp:DropDownList>
                    <asp:SqlDataSource ID="DS_SubirUsuarioSancion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT [ID_Usuario], [N_Usuario] FROM [TB_Usuarios]"></asp:SqlDataSource>
                </div>
                <div class="form-group mx-auto">
                    <asp:Label ID="LblSubirPrestamoSancion" runat="server" Text="Prestamo vencido"></asp:Label>
                    <asp:DropDownList ID="DdlSubirLibroSancion" runat="server" CssClass="form-select textbox-center" DataSourceID="Ds_SubirLibroSancion" DataTextField="N_Libro" DataValueField="ID_Prestamo"></asp:DropDownList>
                    <asp:SqlDataSource ID="Ds_SubirLibroSancion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT TB_Prestamos.ID_Prestamo, TB_Prestamos.NID_Libro, TB_Libros.N_Libro FROM TB_Prestamos INNER JOIN TB_Libros ON TB_Prestamos.NID_Libro = TB_Libros.N_Serie"></asp:SqlDataSource>
                </div>
                <div class="form-group mx-auto">
                    <asp:Label ID="LblSubirMotivoSancion" runat="server" Text="Motivo"></asp:Label>
                    <asp:TextBox ID="TxtSubirMotivoSancion" runat="server" CssClass="form-control textbox-center"></asp:TextBox>
                </div>
                <div class="form-group mx-auto">
                    <asp:Label ID="LblSubriCastigoSancion" runat="server" Text="Sancion"></asp:Label>
                    <asp:TextBox ID="TxtSubriCastigoSancion" runat="server" CssClass="form-control textbox-center"></asp:TextBox>
                </div>
                <div class="form-group mx-auto">
                    <asp:Label ID="Label1" runat="server" Text="Sancion" Visible="false"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" Visible="False" DataSourceID="DS_SubirEstadoPrestamo" DataTextField="N_Estado" DataValueField="Nid_EstadoPrestamo"></asp:DropDownList>

                    <asp:SqlDataSource ID="DS_SubirEstadoPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_EstadoPrestamo]"></asp:SqlDataSource>

                </div>
            </div>
            <div class="row text-center mt-3">
                <div class="form-group">
                    <br />
                    <asp:Button ID="BtnCancelarSubirSancion" runat="server" CssClass="animacion btn btn-warning" Text="Cancelar" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnSubirSancion" runat="server" CssClass="animacion btn btn-success" Text="Realizar Sancion" />
                    <asp:SqlDataSource ID="DS_InsertSancion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" InsertCommand="INSERT INTO TB_Sanciones(Nid_Usuario, Nid_Prestamo, N_FechaSancion, N_Motivo, N_EstadoSancion, N_Sancion) VALUES ( @user , @prestamo, GETDATE(), @MOT, @Esta, @Sanc)" SelectCommand="SELECT * FROM [TB_Sanciones]" UpdateCommand="UPDATE TB_Usuarios SET N_Sancion = @sancion WHERE (ID_Usuario = @user )">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="DdlSubirUsuarioSancion" Name="user" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DdlSubirLibroSancion" Name="prestamo" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TxtSubirMotivoSancion" Name="MOT" PropertyName="Text" />
                            <asp:ControlParameter DefaultValue="1" Name="Esta" ControlID="DropDownList1" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TxtSubriCastigoSancion" DefaultValue="" Name="Sanc" PropertyName="Text" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter DefaultValue="1" Name="sancion" />
                            <asp:ControlParameter ControlID="DdlSubirUsuarioSancion" DefaultValue="" Name="user" PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelConsultarSanciones" runat="server" Visible="false">
        <h2 class="text-center">Consultar Prestamo</h2>
        <asp:SqlDataSource ID="DS_ConultarSansciones" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT TB_Sanciones.ID_Sancion, TB_Usuarios.N_Usuario, TB_Sanciones.Nid_Prestamo, TB_Sanciones.N_FechaSancion, TB_Sanciones.N_Motivo, CAT_EstadoSancion.N_EstadoSancion AS Expr1, TB_Sanciones.N_Sancion FROM TB_Sanciones INNER JOIN CAT_EstadoSancion ON TB_Sanciones.N_EstadoSancion = CAT_EstadoSancion.Nid_EstadoSancion INNER JOIN TB_Usuarios ON TB_Sanciones.Nid_Usuario = TB_Usuarios.ID_Usuario"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Sancion" DataSourceID="DS_ConultarSansciones" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID_Sancion" HeaderText="Registro de sancion" InsertVisible="False" ReadOnly="True" SortExpression="ID_Sancion" />
                <asp:BoundField DataField="N_Usuario" HeaderText="Usuario Sancionado" SortExpression="N_Usuario" />
                <asp:BoundField DataField="Nid_Prestamo" HeaderText="Numero de Prestamo" SortExpression="Nid_Prestamo" />
                <asp:BoundField DataField="N_FechaSancion" HeaderText="Fecha de aplicacion de la sancion" SortExpression="N_FechaSancion" DataFormatString="{0:d}" />
                <asp:BoundField DataField="N_Motivo" HeaderText="Motivo" SortExpression="N_Motivo" />
                <asp:BoundField DataField="Expr1" HeaderText="Estado de la sancion" SortExpression="Expr1" />
                <asp:BoundField DataField="N_Sancion" HeaderText="Sancion a cumplir" SortExpression="N_Sancion" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <div class="text-center">
            <br />
            <asp:Button ID="BtnCerrarConsultas" runat="server" CssClass="animacion btn btn-warning" Text="Cerrar" />
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelActualizarSancion" runat="server" Visible="false">
        <h2 class="text-center">Actualización de Sanción</h2>
        <div class="container text-center">
            <asp:SqlDataSource ID="DS_ModificarSancionGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>"
                SelectCommand="SELECT TOP (1000) TB_Sanciones.ID_Sancion, TB_Usuarios.N_Usuario, TB_Sanciones.Nid_Prestamo, TB_Sanciones.N_FechaSancion, TB_Sanciones.N_Motivo, CAT_EstadoSancion.N_EstadoSancion AS Expr1, TB_Sanciones.N_Sancion FROM TB_Sanciones INNER JOIN CAT_EstadoSancion ON TB_Sanciones.N_EstadoSancion = CAT_EstadoSancion.Nid_EstadoSancion INNER JOIN TB_Usuarios ON TB_Sanciones.Nid_Usuario = TB_Usuarios.ID_Usuario"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridViewSanciones" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID_Sancion" DataSourceID="DS_ModificarSancionGV" Width="100%">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID_Sancion" HeaderText="Numero de Sancion" InsertVisible="False" ReadOnly="True" SortExpression="ID_Sancion" />
                    <asp:BoundField DataField="N_Usuario" HeaderText="Usuario Sancionado" SortExpression="N_Usuario" />
                    <asp:BoundField DataField="Nid_Prestamo" HeaderText="Numeor de Prestamo" SortExpression="Nid_Prestamo" />
                    <asp:BoundField DataField="N_FechaSancion" HeaderText="Fecha de aplicaion" SortExpression="N_FechaSancion" />
                    <asp:BoundField DataField="N_Motivo" HeaderText="Motivo" SortExpression="N_Motivo" />
                    <asp:BoundField DataField="Expr1" HeaderText="Estado" SortExpression="Expr1" />
                    <asp:BoundField DataField="N_Sancion" HeaderText="Sancion" SortExpression="N_Sancion" />
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
            <asp:SqlDataSource ID="DS_ModificarSancion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [TB_Sanciones] WHERE ([ID_Sancion] = @ID_Sancion)" UpdateCommand="UPDATE TB_Sanciones SET Nid_Usuario = @usr, Nid_Prestamo = @pre, N_FechaSancion = @fch, N_Motivo = @mot, N_EstadoSancion = @est, N_Sancion = @san WHERE (ID_Sancion = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Aux" Name="ID_Sancion" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="DdlModUserSancion" Name="usr" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DdlModPrestamoSancion" Name="pre" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="fch" ControlID="TxtModFechaSancion" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtModMotivoSancion" Name="mot" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DdlModEstadoSancion" Name="est" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtModSancion" Name="san" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtModIdSancion" Name="id" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="BtnCerrarModificacionSancion" runat="server" Text="Cerrar" CssClass="btn btn-success animacion" />
        </div>
        <div class="row">
            <div class="col">
                <asp:Label ID="Aux" runat="server"></asp:Label>
            </div>
            <div class="col">
                <asp:Panel ID="PanelFromEditarSancion" runat="server" Visible="false" CssClass="text-center mt-3">
                    <div class="container">
                        <div class="container">
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModIdSancion" runat="server" Text="Numero de sancion"></asp:Label>
                                <asp:TextBox ID="TxtModIdSancion" runat="server" CssClass="form-control textbox-center" TextMode="Number" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModUserSancion" runat="server" Text="Usuario sancionado"></asp:Label>
                                <asp:DropDownList ID="DdlModUserSancion" runat="server" CssClass="form-select textbox-center" DataSourceID="DS_ModUserSancion" DataTextField="N_Usuario" DataValueField="ID_Usuario"></asp:DropDownList>
                                <asp:SqlDataSource ID="DS_ModUserSancion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT [ID_Usuario], [N_Usuario] FROM [TB_Usuarios]"></asp:SqlDataSource>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModPrestamoSancion" runat="server" Text="Numero de prestamo"></asp:Label>
                                <asp:DropDownList ID="DdlModPrestamoSancion" runat="server" CssClass="form-select textbox-center" DataSourceID="DS_ModPrestamoSancion" DataTextField="N_Libro" DataValueField="ID_Prestamo"></asp:DropDownList>
                                <asp:SqlDataSource ID="DS_ModPrestamoSancion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT TB_Prestamos.ID_Prestamo, TB_Prestamos.NID_Libro, TB_Libros.N_Libro FROM TB_Prestamos INNER JOIN TB_Libros ON TB_Prestamos.NID_Libro = TB_Libros.N_Serie"></asp:SqlDataSource>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModFechaSancion" runat="server" Text="Fecha de apliacion de la sancion"></asp:Label>
                                <asp:TextBox ID="TxtModFechaSancion" runat="server" CssClass="form-control textbox-center" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModMotivoSancion" runat="server" Text="Motivo de la sancion"></asp:Label>
                                <asp:TextBox ID="TxtModMotivoSancion" runat="server" CssClass="form-control textbox-center" Rows="2" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModEstadoSancion" runat="server" Text="Estado de la sancion"></asp:Label>
                                <asp:DropDownList ID="DdlModEstadoSancion" runat="server" CssClass="form-select textbox-center" DataSourceID="DS_ModEstadoSancion" DataTextField="N_EstadoSancion" DataValueField="Nid_EstadoSancion"></asp:DropDownList>
                                <asp:SqlDataSource ID="DS_ModEstadoSancion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT [Nid_EstadoSancion], [N_EstadoSancion] FROM [CAT_EstadoSancion]"></asp:SqlDataSource>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModSancion" runat="server" Text="Sancion a cumplir"></asp:Label>
                                <asp:TextBox ID="TxtModSancion" runat="server" CssClass="form-control textbox-center" Rows="2" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row text-center mt-3">
                            <div class="form-group">
                                <br />
                                <asp:Button ID="BtnCerrarModSancion" runat="server" CssClass="animacion btn btn-warning" Text="Cancelar" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BtnActualizarSancion" runat="server" CssClass="animacion btn btn-success" Text="Actualziar Sancion" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
