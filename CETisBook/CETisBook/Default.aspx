<%@ Page Title="Inicio" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CETisBook._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div class="containers">
            <img src="IMG/books.jpg" />
            <div class="message-boxs">
                <p>
                    Se les recuerda que entregen sus libros a tiempo para evitar sanciones
                    <br />
                    ATTE: la adminsitracion de la biblioteca
                </p>
            </div>

        </div>
                    <br />            <br />            <br />
        <asp:Panel ID="PnlAdmin" runat="server">
            <section>
                <div class="container text-center">
                    <h2 class="text-white" style="background-color:#86161d;"> --> Acceso administrador <--</h2>
                    <h4> Ir a panel de control </h4>
                    <asp:Button ID="BtnPanelControl" runat="server" CssClass="animacion testbutton" Text="Administracion del sistema" />
                </div>
            </section>
        </asp:Panel>
    </main>

</asp:Content>
