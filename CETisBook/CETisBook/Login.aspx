<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="CETisBook.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CETIsBook | Iniciar Sesion</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" />
    <!-- Estilos personalizados -->
    <link href="CSS/CetisBook.css" rel="stylesheet" />
    <!-- funciones js -->
    <script src="JS/Funciones.js"></script>
</head>
<body>
    <form id="LoginForm" runat="server">
        <div class="container" id="login" runat="server">
            <div class="login-card">
                <h3 class="login-title">Iniciar Sesión</h3>
                <img src="IMG/CetisLogo.png" class="centered-image img-fluid mb-4" alt="Imagen Extra" style="max-height: 200px; max-width: 100%;" />
                <div class="form-group">
                    <label for="txtUsername"><i class="fas fa-user"></i>Usuario</label>
                    <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" placeholder="Ingresa tu usuario"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPassword"><i class="fas fa-lock"></i>Contraseña</label>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Ingresa tu contraseña"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-center">
                    <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-block custom-button" runat="server" Text="Iniciar Sesión" />
                </div>
                <br />
                <div class="form-group text-center">
                    <asp:Button ID="BtnRegAdmin" CssClass="btn btn-primary btn-block custom-button" runat="server" Text="Registrar Administrador" />
                </div>
            </div>
        </div>
        <asp:Panel ID="PnlRegAdmin" runat="server" Visible="false" CssClass="text-black" Width="550px" style="padding:10px, 10px, 10px, 10px; background-color:#ffe0e2;">
            <h2 class="text-center bg-warning">Registrar Usuario Administrador</h2>
        <div class="row" style="padding: 10px;">
            <div class="col">
                <div class="form-group">
                    <label for="txtUsuario">Usuario:</label>
                    <asp:TextBox ID="txtRegUsuario" runat="server" CssClass="form-control" placeholder="Nombre de usuario" ToolTip="Ingrese un nombre de usuario de almenos 5 caracteres"/>
                </div>
                <div class="form-group">
                    <label for="txtPassword">Contraseña:</label>
                    <asp:TextBox ID="txtRegPass" runat="server" CssClass="form-control" placeholder="Contraseña" ToolTip="Ingrese una contraseña 8 caracteres"/>
                </div>
                <div class="form-group">
                    <label for="txtMail">Correo Electrónico:</label>
                    <asp:TextBox ID="txtMail" runat="server" CssClass="form-control" placeholder="ejemplo@gmail.com" ToolTip="Ingrese un correo electronico" TextMode="Email"/>
                </div>
                <div class="form-group">
                    <label for="txtRol">Rol:</label>
                    <asp:DropDownList ID="ddlrol" runat="server" CssClass="form-select" DataSourceID="DS_Rol" DataTextField="N_Rol" DataValueField="Nid_Rol"></asp:DropDownList>
                    <asp:SqlDataSource ID="DS_Rol" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" SelectCommand="SELECT * FROM [CAT_Roles]"></asp:SqlDataSource>
                    <br />
                </div>
            </div>
        </div>
            <div class="form-group text-center">
                <asp:Button ID="BtnCancelar" runat="server" Text="cancelar" CssClass="btn btn-primary btn-block custom-button" />
                <asp:Button ID="BtnRegistrar" runat="server" Text="registrar" CssClass="btn btn-primary btn-block custom-button" />
                <br />
                <br />
            </div>
        </asp:Panel>

        <!-- Modal de alerta -->
        <div class="modal-container" id="customModal">
            <div class="modal-content">
                <img src="../img/GIFS/alerta.gif" width="100px" height="75px" />
                <h2>¡Alerta!</h2>
                <p id="modalMessage"></p>
                <button class="modal-button" onclick="closeModal()">Aceptar</button>
            </div>
        </div>
        <asp:SqlDataSource ID="DS_Login" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" ProviderName="<%$ ConnectionStrings:CS_CETIsBook.ProviderName %>" SelectCommand="SELECT * FROM [TB_Usuarios] WHERE (([N_Usuario] = @N_Usuario) AND ([N_Password] = @N_Password))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtUsername" Name="N_Usuario" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtPassword" Name="N_Password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_Registrar" runat="server" ConnectionString="<%$ ConnectionStrings:CS_CETIsBook %>" InsertCommand="INSERT INTO TB_Usuarios(N_Usuario, N_Password, N_Mail, N_Rol, Nid_Registro, N_FechaRegistro, N_EstadoUsuario) VALUES ( @user , @pass, @mail, @rol, @reg, GETDATE(), @estado)" SelectCommand="SELECT ID_Usuario, N_Usuario, N_Password FROM TB_Usuarios">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtRegUsuario" Name="user" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtRegPass" Name="pass" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtMail" Name="mail" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddlrol" Name="rol" PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="1" Name="reg" />
                <asp:Parameter DefaultValue="1" Name="estado" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
    <!-- Footer -->
    <div class="footer">
        <p>
            <img src="IMG/LogoCetis18.png" height="50px" width="50px" />
            &copy; <%= DateTime.Now.Year %>- CETIsBook
        </p>
    </div>
    <!-- jQuery y Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
