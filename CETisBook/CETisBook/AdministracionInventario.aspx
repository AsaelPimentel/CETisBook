<%@ Page Title="Inventario" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AdministracionInventario.aspx.vb" Inherits="CETisBook.AdministracionInventario" %>

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
                            <h1>Administracion de Inventarios.</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="d-flex justify-content-center">
                <!-- Utilizamos d-flex y justify-content-center para centrar horizontalmente -->
                <div class="card">
                    <img src="IMG/Pagina-en-obras.jpg" class="card-img-top" />
                    <div class="card-body text-center">
                        <h3 class="card-title">Lo sentimos</h3>
                        <p class="card-text">El equipo de desarrollo esta trabajando en este apartado y no será visible hasta que esté terminado. Le pedimos que tome sus debidas precauciones si tiene algún proceso que dependa de este apartado. Le informaremos inmediatamente una vez que esté terminado.</p>
                        <a href="Administracion.aspx" class="btn btn-primary animacion">Volver a administracion</a>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
