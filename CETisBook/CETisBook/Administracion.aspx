<%@ Page Title="Administracion" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Administracion.aspx.vb" Inherits="CETisBook.Administracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container ">
        <h1 class="text-center">Panel de control</h1>
        <div class="container text-center">
            <div class="row row-cols-2">
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnLibros" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/Botones/Libros.png" />
                    <div class="col">
                        <asp:Label ID="LblLibros" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Administracion de libros"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnPrestamos" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/Botones/Prestamo.png" />
                    <div class="col">
                        <asp:Label ID="LblPrestamos" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Administracion de prestamos"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnSanciones" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/Botones/sancion.png" />
                    <div class="col">
                        <asp:Label ID="LblSanciones" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Administracion de sanciones"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnInventario" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/Botones/inventario.png" />
                    <div class="col">
                        <asp:Label ID="LblInvetario" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Administracion de invetario"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnUsuarios" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/Botones/usuario.png" />
                    <div class="col">
                        <asp:Label ID="LblUsuarios" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Administracion de usuarios"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 g-3">
                    <asp:ImageButton ID="ImgBtnReportes" Style="height: 150px; width: 150px;" CssClass="animacion" runat="server" ImageUrl="~/IMG/Botones/reporte.png" />
                    <div class="col">
                        <asp:Label ID="LblReportes" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Administracion de reportes"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
