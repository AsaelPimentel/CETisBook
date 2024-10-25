<%@ Page Title="Prestamos" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AdministracionPrestamos.aspx.vb" Inherits="CETisBook.AdministracionPrestamos" %>

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
                            <h1>Administracion de Prestamos.</h1>
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
                    <asp:ImageButton ID="ImgBtnRegistrarPrestamo" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/AgregarPrestamo.png" />
                    <div class="col">
                        <asp:Label ID="LblImgBtnRegistrarPrestamo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Nuevo Prestamos"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnConsultarPrestamo" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/BuscarPrestamo.png" />
                    <div class="col">
                        <asp:Label ID="LblImgBtnConsultarPrestamo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Consultar Prestamos"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnEditarPrestamo" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/ModificarPrestamo.png" />
                    <div class="col">
                        <asp:Label ID="LblImgBtnEditarPrestamo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Devoluciones o cambio de prestamo"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelNuevoPrestamo" runat="server" Visible="false" CssClass="text-center mt-3">
        <h2>Nuevo Prestamo</h2>
        <div class="container">
            <div class="container">
                <div class="form-group mx-auto">
                    <!-- Aplica la clase mx-auto aquí -->
                    <asp:Label ID="LblSubirUsuarioPrestamo" runat="server" Text="Usuario a prestar el libro"></asp:Label>
                    <asp:DropDownList ID="DdlSubirUsuarioPrestamo" CssClass="form-select textbox-center" runat="server" DataSourceID="DS_SubirPersonaPrestamo" DataTextField="N_Usuario" DataValueField="ID_Usuario"></asp:DropDownList>
                    <asp:SqlDataSource ID="DS_SubirPersonaPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT [ID_Usuario], [N_Usuario] FROM [TB_Usuarios]"></asp:SqlDataSource>
                </div>
                <div class="form-group mx-auto">
                    <!-- Aplica la clase mx-auto aquí -->
                    <asp:Label ID="LblSubirLibroPestamo" runat="server" Text="Libro a prestar"></asp:Label>
                    <asp:DropDownList ID="DdlSubirLibroPestamo" CssClass="form-select textbox-center" runat="server" DataSourceID="DS_SubirLibroPrestamo" DataTextField="N_Libro" DataValueField="N_Serie"></asp:DropDownList>
                    <asp:SqlDataSource ID="DS_SubirLibroPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT [N_Serie], [N_Portada], [N_Libro] FROM [TB_Libros]"></asp:SqlDataSource>
                </div>
                <div class="form-group mx-auto">
                    <!-- Aplica la clase mx-auto aquí -->
                    <asp:Label ID="LblSubirFechaInicioPrestamo" runat="server" Text="Fecha de prestamo"></asp:Label>
                    <asp:TextBox ID="TxtSubirFechaInicioPrestamo" CssClass="form-control textbox-center" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group mx-auto">
                    <!-- Aplica la clase mx-auto aquí -->
                    <asp:Label ID="LblSubirFechaFinPrestamo" runat="server" Text="Fecha de devolucion "></asp:Label>
                    <asp:TextBox ID="TxtSubirFechaFinPrestamo" CssClass="form-control textbox-center" runat="server" TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <div class="row text-center mt-3">
                <div class="form-group">
                    <asp:Button ID="BtnCancelarSubirPrestamo" runat="server" CssClass="animacion btn btn-warning" Text="Cancelar" />
                    &nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnSubirPrestamo" runat="server" CssClass="animacion btn btn-success" Text="Realizar prestamo" />
                    <br />
                    <asp:SqlDataSource ID="DS_SubirPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" InsertCommand="INSERT INTO TB_Prestamos(NID_Usuario, NID_Libro, FechaPrestamo, FechaDevolucion, EstadoPrestamo) VALUES ( @user , @libro, @presta, @devol, @esta)" SelectCommand="SELECT * FROM [TB_Prestamos]" UpdateCommand="UPDATE TB_Libros SET N_Estado = @estado WHERE (N_Serie = @serie)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="DdlSubirUsuarioPrestamo" Name="user" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DdlSubirLibroPestamo" Name="libro" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TxtSubirFechaInicioPrestamo" Name="presta" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TxtSubirFechaFinPrestamo" Name="devol" PropertyName="Text" />
                            <asp:Parameter DefaultValue="1" Name="esta" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:ControlParameter DefaultValue="2" Name="estado" />
                            <asp:ControlParameter ControlID="DdlSubirLibroPestamo" DefaultValue="" Name="serie" PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelBuscarPrestamo" runat="server" Visible="false">
        <h2 class="text-center">Consultar Prestamo</h2>
        <div class="container">
            <div class="container">
                <asp:DropDownList ID="DdlFiltroPrestamos" CssClass="form-select" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlFiltroPrestamos_SelectedIndexChanged">
                    <asp:ListItem Text="General" Value="General" />
                    <asp:ListItem Text="Vencidos" Value="Vencidos" />
                    <asp:ListItem Text="Atrasados" Value="Atrasados" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="DS_BuscarPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT TB_Prestamos.ID_Prestamo, TB_Usuarios.N_Usuario, TB_Prestamos.NID_Libro, TB_Libros.N_Libro, TB_Prestamos.FechaPrestamo, TB_Prestamos.FechaDevolucion, CAT_EstadoPrestamo.N_Estado, TB_Prestamos.ID_Sancion FROM TB_Prestamos INNER JOIN TB_Usuarios ON TB_Prestamos.NID_Usuario = TB_Usuarios.ID_Usuario INNER JOIN TB_Libros ON TB_Prestamos.NID_Libro = TB_Libros.N_Serie INNER JOIN CAT_EstadoPrestamo ON TB_Prestamos.EstadoPrestamo = CAT_EstadoPrestamo.Nid_EstadoPrestamo"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID_Prestamo" DataSourceID="DS_BuscarPrestamo" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="ID_Prestamo" HeaderText="No. de Prestamo" InsertVisible="False" ReadOnly="True" SortExpression="ID_Prestamo" />
                        <asp:BoundField DataField="N_Usuario" HeaderText="Usuario responsable" SortExpression="N_Usuario" />
                        <asp:BoundField DataField="N_Libro" HeaderText="Nombre del Libro" SortExpression="N_Libro" />
                        <asp:BoundField DataField="FechaPrestamo" HeaderText="Fecha de Prestamo" SortExpression="FechaPrestamo" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="FechaDevolucion" HeaderText="Fecha de Devolucion" SortExpression="FechaDevolucion" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="N_Estado" HeaderText="Estado" SortExpression="N_Estado" />
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
        </div>

        <div class="form-group text-center">
            <br />
            <asp:Button ID="BtnCerrarBuscarPrestamos" runat="server" Text="Cerrar" CssClass="btn btn-success animacion" />
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelActualizarPrestamo" runat="server" Visible="false">
        <h2 class="text-center">Devolucion o actualizacion de Prestamo</h2>
        <div class="container text-center">
            <asp:SqlDataSource ID="DS_ModificarPrestamoGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT TB_Prestamos.ID_Prestamo, TB_Usuarios.N_Usuario, TB_Prestamos.NID_Libro, TB_Libros.N_Libro, TB_Prestamos.FechaPrestamo, TB_Prestamos.FechaDevolucion, CAT_EstadoPrestamo.N_Estado FROM TB_Prestamos INNER JOIN TB_Usuarios ON TB_Prestamos.NID_Usuario = TB_Usuarios.ID_Usuario INNER JOIN TB_Libros ON TB_Prestamos.NID_Libro = TB_Libros.N_Serie INNER JOIN CAT_EstadoPrestamo ON TB_Prestamos.EstadoPrestamo = CAT_EstadoPrestamo.Nid_EstadoPrestamo"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID_Prestamo" DataSourceID="DS_ModificarPrestamoGV" Width="100%">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID_Prestamo" HeaderText="No. de Prestamo" InsertVisible="False" ReadOnly="True" SortExpression="ID_Prestamo" />
                    <asp:BoundField DataField="N_Usuario" HeaderText="Usuario responsable" SortExpression="N_Usuario" />
                    <asp:BoundField DataField="NID_Libro" HeaderText="No de serie" SortExpression="NID_Libro" />
                    <asp:BoundField DataField="N_Libro" HeaderText="Nombre del libro" SortExpression="N_Libro" />
                    <asp:BoundField DataField="FechaPrestamo" HeaderText="Fecha de Prestamo" SortExpression="FechaPrestamo" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="FechaDevolucion" HeaderText="Fecha de Devolucion" SortExpression="FechaDevolucion" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="N_Estado" HeaderText="Estado del prestamo" SortExpression="N_Estado" />
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
            <asp:SqlDataSource ID="DS_ModificarPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [TB_Prestamos] WHERE ([ID_Prestamo] = @ID_Prestamo)" UpdateCommand="UPDATE TB_Prestamos SET NID_Usuario = @user , NID_Libro = @libro, FechaPrestamo = @fechainicio, FechaDevolucion = @fechafin, EstadoPrestamo = @estado WHERE (ID_Prestamo = @ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Aux" Name="ID_Prestamo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="DdlModificarUsuarioPrestamo" Name="user" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DdlModificarLibroPrestamo" Name="libro" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtModificarFechaInicioPrestamo" Name="fechainicio" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtModificarFechaFinPrestamo" Name="fechafin" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DdlModificarEstadoPrestamo" Name="estado" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtModificarIdPrestamo" Name="ID" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="BtnCerrarModificacionPrestamos" runat="server" Text="Cerrar" CssClass="btn btn-success animacion" />
        </div>
        <div class="row">
            <div class="col">
                <asp:Label ID="Aux" runat="server"></asp:Label>
            </div>
            <div class="col offset-md-5">
                <asp:Panel ID="PanelFormEditarPrestamo" runat="server" Visible="false" CssClass="text-center mt-3">
                    <div class="container">
                        <div class="container">
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModificarIdPrestamo" runat="server" Text="Numero de prestamo"></asp:Label>
                                <asp:TextBox ID="TxtModificarIdPrestamo" CssClass="form-control" runat="server" ReadOnly="True" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModificarUsuarioPrestamo" runat="server" Text="Usuario responsable"></asp:Label>
                                <asp:DropDownList ID="DdlModificarUsuarioPrestamo" CssClass="form-select" runat="server" DataSourceID="DS_ModificarUsuarioPrestamo" DataTextField="N_Usuario" DataValueField="ID_Usuario"></asp:DropDownList>
                                <asp:SqlDataSource ID="DS_ModificarUsuarioPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT [ID_Usuario], [N_Usuario] FROM [TB_Usuarios]"></asp:SqlDataSource>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModificarLibroPrestamo" runat="server" Text="Libro prestado"></asp:Label>
                                <asp:DropDownList ID="DdlModificarLibroPrestamo" CssClass="form-select" runat="server" DataSourceID="DS_ModificarLibroPrestamo" DataTextField="N_Libro" DataValueField="N_Serie"></asp:DropDownList>
                                <asp:SqlDataSource ID="DS_ModificarLibroPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT [N_Serie], [N_Libro] FROM [TB_Libros]"></asp:SqlDataSource>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModificarFechaInicioPrestamo" runat="server" Text="Fecha de prestamo"></asp:Label>
                                <asp:TextBox ID="TxtModificarFechaInicioPrestamo" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModificarFechaFinPrestamo" runat="server" Text="Fecha de devolucion"></asp:Label>
                                <asp:TextBox ID="TxtModificarFechaFinPrestamo" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="form-group mx-auto">
                                <asp:Label ID="LblModificarEstadoPrestamo" runat="server" Text="Estado del prestamo"></asp:Label>
                                <asp:DropDownList ID="DdlModificarEstadoPrestamo" CssClass="form-select" runat="server" DataSourceID="DS_ModificarEstadoPrestamo" DataTextField="N_Estado" DataValueField="Nid_EstadoPrestamo"></asp:DropDownList>
                                <asp:SqlDataSource ID="DS_ModificarEstadoPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_EstadoPrestamo]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="row text-center mt-3">
                            <div class="form-group">
                                <asp:Button ID="BtnCerrarModPrestamo" runat="server" CssClass="animacion btn btn-warning" Text="Cancelar" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BtnActualizarPrestamo" runat="server" CssClass="animacion btn btn-success" Text="Modificar prestamo" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
