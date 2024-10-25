<%@ Page Title="Usuarios" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AdministracionUsuarios.aspx.vb" Inherits="CETisBook.AdministracionUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section>
            <div class="container">
                <div class="container text-center">
                    <div class="row">
                        <div class="col">
                            <asp:ImageButton ID="ImgBtnVolver" CssClass="rounded float-start cerrar" runat="server" Style="height: 50px; width: 50px;" ImageUrl="~/IMG/Volver.png" />
                        </div>
                        <div class="col-11">
                            <h1>Administracion de Usuarios.</h1>
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
                    <asp:ImageButton ID="ImgBtnRegistrarUsuarios" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/anadir-usuario.png" />
                    <div class="col">
                        <asp:Label ID="LblRegistrarUsuario" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Registrar Usuario"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnConsultarUsuarios" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/buscar-usuario.png" />
                    <div class="col">
                        <asp:Label ID="LblConsultarUsuarios" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Consultar Usuarios"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnEditarUsuarios" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/BotonesPanel/editar-usuario.png" />
                    <div class="col">
                        <asp:Label ID="LblEditarUsuarios" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Editar Usuarios"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelSubirUsuarios" runat="server" Visible="false">
        <h2 class="text-center">Agregar Usuarios</h2>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirNombreUsuario" runat="server" Text="Nombre de usuario"></asp:Label>
                        <asp:TextBox ID="TxtSubirNombreUsuario" placeholder="Ingrese un nombre de usuario" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirPasswordUsuario" runat="server" Text="Contraseña"></asp:Label>
                        <asp:TextBox ID="TxtSubirPasswordUsuario" runat="server" CssClass="form-control" placeholder="Ingrese una contraseña" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirMailUsuario" runat="server" Text="Correo electronico"></asp:Label>
                        <asp:TextBox ID="TxtSubirMailUsuario" runat="server" placeholder="ejemplo@gmail.com" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirRolUsuario" runat="server" Text="Rol de usuario"></asp:Label>
                        <asp:DropDownList ID="DdlSubirRolUsuario" runat="server" CssClass="form-select" DataSourceID="DS_SubirRolUsuario" DataTextField="N_Rol" DataValueField="Nid_Rol"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirRolUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_Roles]"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirPersonaUsuario" runat="server" Text="Persona que pertenecera el usuario"></asp:Label>
                        <asp:DropDownList ID="DdlSubirPersonaUsuario" CssClass="form-select" runat="server" DataSourceID="DS_SubirPersonaUsuario" DataTextField="N_Nombre" DataValueField="ID_Personal"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirPersonaUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [TB_Personas]"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="LblSubirEstadoUsuario" runat="server" Text="Estado de usuario"></asp:Label>
                        <asp:DropDownList ID="DdlSubirEstadoUsuario" CssClass="form-select" runat="server" DataSourceID="DS_SubirEstadoUsuario" DataTextField="N_Estado" DataValueField="Nid_Estado"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirEstadoUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_EstadoUsuario]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div class="text-center form-group">
                <br />
                <asp:Button ID="BtnCerrarSubirUsuario" runat="server" Text="Cerrar" CssClass="btn btn-outline-secondary animacion" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnSubirUsuario" runat="server" Text="Registrar Usuario" CssClass="btn btn-outline-success animacion" />
                <asp:SqlDataSource ID="DS_SubirUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" InsertCommand="INSERT INTO TB_Usuarios(N_Usuario, N_Password, N_Mail, N_Rol, Nid_Registro, N_FechaRegistro, N_EstadoUsuario) VALUES ( @user , @pass, @mail, @rol, @reg, GETDATE(), @estado)" SelectCommand="SELECT * FROM [TB_Usuarios]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TxtSubirNombreUsuario" Name="user" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TxtSubirPasswordUsuario" Name="pass" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TxtSubirMailUsuario" Name="mail" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DdlSubirRolUsuario" Name="rol" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DdlSubirPersonaUsuario" Name="reg" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DdlSubirEstadoUsuario" Name="estado" PropertyName="SelectedValue" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelConsultarUsuarios" runat="server" Visible="false">
        <h2 class="text-center">Buscar Usuarios</h2>
        <div class="container text-center">
            <asp:SqlDataSource ID="DS_ConsultarUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT TB_Usuarios.ID_Usuario, TB_Usuarios.N_Usuario, TB_Usuarios.N_Password, TB_Usuarios.N_Mail, CAT_Roles.N_Rol AS Expr1, TB_Personas.N_Nombre, TB_Usuarios.N_FechaRegistro, CAT_EstadoUsuario.N_Estado FROM TB_Usuarios INNER JOIN CAT_EstadoUsuario ON TB_Usuarios.N_EstadoUsuario = CAT_EstadoUsuario.Nid_Estado INNER JOIN TB_Personas ON TB_Usuarios.Nid_Registro = TB_Personas.ID_Personal INNER JOIN CAT_Roles ON TB_Usuarios.N_Rol = CAT_Roles.Nid_Rol"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Usuario" DataSourceID="DS_ConsultarUsuarios" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID_Usuario" HeaderText="Numero de control" InsertVisible="False" ReadOnly="True" SortExpression="ID_Usuario" />
                    <asp:BoundField DataField="N_Usuario" HeaderText="Nombre de Usuario" SortExpression="N_Usuario" />
                    <asp:BoundField DataField="N_Mail" HeaderText="Correo electronico" SortExpression="N_Mail" />
                    <asp:BoundField DataField="Expr1" HeaderText="Rol de usuario" SortExpression="Expr1" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="N_FechaRegistro" HeaderText="Fecha de registro" SortExpression="N_FechaRegistro" />
                    <asp:BoundField DataField="N_Estado" HeaderText="Estado del usuario" SortExpression="N_Estado" />
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
            <br />
            <asp:Button ID="BtnCerrarConsultaUsuarios" runat="server" Text="Cerrar" CssClass="btn btn-outline-secondary animacion" />
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelEditarUsuarios" runat="server" Visible="False">
        <h2 class="text-center">Buscar Usuarios</h2>
        <div class="container text-center">
            <asp:SqlDataSource ID="DS_ModUserGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT TB_Usuarios.ID_Usuario, TB_Usuarios.N_Usuario, TB_Usuarios.N_Password, TB_Usuarios.N_Mail, CAT_Roles.N_Rol AS Expr1, TB_Personas.N_Nombre, TB_Usuarios.N_FechaRegistro, CAT_EstadoUsuario.N_Estado FROM TB_Usuarios INNER JOIN CAT_EstadoUsuario ON TB_Usuarios.N_EstadoUsuario = CAT_EstadoUsuario.Nid_Estado INNER JOIN TB_Personas ON TB_Usuarios.Nid_Registro = TB_Personas.ID_Personal INNER JOIN CAT_Roles ON TB_Usuarios.N_Rol = CAT_Roles.Nid_Rol"></asp:SqlDataSource>
            <asp:GridView ID="GVModificarUser" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Usuario" DataSourceID="DS_ModUserGV" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID_Usuario" HeaderText="Numero de control" InsertVisible="False" ReadOnly="True" SortExpression="ID_Usuario" />
                    <asp:BoundField DataField="N_Usuario" HeaderText="Nombre de usuario" SortExpression="N_Usuario" />
                    <asp:BoundField DataField="N_Mail" HeaderText="Correo" SortExpression="N_Mail" />
                    <asp:BoundField DataField="Expr1" HeaderText="Rol de usuario" SortExpression="Expr1" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="N_FechaRegistro" HeaderText="Fecha de registro" SortExpression="N_FechaRegistro" />
                    <asp:BoundField DataField="N_Estado" HeaderText="Estado de usuario" SortExpression="N_Estado" />
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
            <asp:SqlDataSource ID="DS_ModificarUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [TB_Usuarios] WHERE ([ID_Usuario] = @ID_Usuario)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Aux" Name="ID_Usuario" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="BtnCerrarModificaciones" runat="server" CssClass="btn btn-info" Text="Cerrar" />
            <br />

        </div>
        <div class="row">
            <div class="col">
                <asp:Label ID="Aux" runat="server"></asp:Label>
            </div>
            <div class="col">
                <asp:Panel ID="PanelFromEditarUsuario" runat="server" Visible="false">
                    <h4 class="text-center">Modifcar Registro de libro</h4>
                    <div class="container text-center">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="LblModifcarIDUsuario" runat="server" Text="Numero de control"></asp:Label>
                                    <asp:TextBox ID="TxtModifcarIDUsuario" runat="server" CssClass="form-control" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="LblModificarNombreUsuario" runat="server" Text="Nombre de usuario"></asp:Label>
                                    <asp:TextBox ID="TxtModificarNombreUsuario" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="LblModificarPasswordUsuario" runat="server" Text="Contraseña"></asp:Label>
                                    <asp:TextBox ID="TxtModificarPasswordUsuario" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="LblModificarMailUsuario" runat="server" Text="Correo electronico"></asp:Label>
                                    <asp:TextBox ID="TxtModificarMailUsuario" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="LblModificarRolUsuario" runat="server" Text="Rol de usuario"></asp:Label>
                                    <asp:DropDownList ID="DdlModificarRolUsuario" CssClass="form-select" runat="server" DataSourceID="DS_ModificarRolUsuario" DataTextField="N_Rol" DataValueField="Nid_Rol"></asp:DropDownList>
                                    <asp:SqlDataSource ID="DS_ModificarRolUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_Roles]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="LblModificarPersonaUsuario" runat="server" Text="Persona que pertenecera el usuario"></asp:Label>
                                    <asp:DropDownList ID="DdlModificarPersonaUsuario" CssClass="form-select" runat="server" DataSourceID="DS_ModificarPersonaUsuario" DataTextField="N_Nombre" DataValueField="ID_Personal"></asp:DropDownList>
                                    <asp:SqlDataSource ID="DS_ModificarPersonaUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [TB_Personas]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="LblModificarFechaRegistro" runat="server" Text="Fecha de registro"></asp:Label>
                                    <asp:TextBox ID="TxtModificarFechaRegistro" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="LblModificarEstadoUsuario" runat="server" Text="Estado del usuario"></asp:Label>
                                    <asp:DropDownList ID="DdlModificarEstadoUsuario" CssClass="form-select" runat="server" DataSourceID="DS_ModificarEstadoUsuario" DataTextField="N_Estado" DataValueField="Nid_Estado"></asp:DropDownList>
                                    <asp:SqlDataSource ID="DS_ModificarEstadoUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_EstadoUsuario]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <br />
                                <asp:Button ID="BtnCacelarModificacionLibro" runat="server" Text="Cancelar" CssClass="animacion btn btn-info" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BtnModificarLibro" runat="server" CssClass="animacion btn btn-warning" Text="Modificar libro" />
                                <asp:SqlDataSource ID="DS_ActualizarUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [TB_Usuarios]" UpdateCommand="UPDATE TB_Usuarios SET N_Usuario = @user , N_Password = @pass, N_Mail = @mail, N_Rol = @rol, Nid_Registro = @reg, N_EstadoUsuario = @esta WHERE (ID_Usuario = @id)">
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="TxtModificarNombreUsuario" Name="user" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtModificarPasswordUsuario" Name="pass" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtModificarMailUsuario" Name="mail" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="DdlModificarRolUsuario" Name="rol" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DdlModificarPersonaUsuario" Name="reg" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DdlModificarEstadoUsuario" Name="esta" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="TxtModifcarIDUsuario" Name="id" PropertyName="Text" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
