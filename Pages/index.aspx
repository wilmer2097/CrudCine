<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CrudCine.Pages.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    INICIO
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <section class="fondo">
        <div class="carrousel container mb-5">
            <div class="row">
                <div class="izquierda col-md-6 text-center my-auto">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
                        <ol class="carousel-indicators">
                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" id="imagen">
                            <div class="carousel-item active">
                                <img src="https://images4.alphacoders.com/127/thumbbig-1273867.webp" class="img-fluid d-block rounded mx-auto" alt="Imagen 1">
                            </div>
                            <div class="carousel-item">
                                <img src="https://images8.alphacoders.com/643/thumbbig-643469.webp" class="img-fluid d-block rounded mx-auto" alt="Imagen 2">
                            </div>
                            <div class="carousel-item">
                                <img src="https://images2.alphacoders.com/643/thumbbig-643516.webp" class="img-fluid d-block rounded mx-auto" alt="Imagen 3">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Anterior</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Siguiente</span>
                        </a>
                    </div>
                </div>
                <div class="derecha col-md-6 text-justify my-auto">
                    <div>
                        <h3>Nombre</h3>
                        <div>
                            <p>One Piece</p>
                        </div>
                        <div>
                            <div>
                                <h3>Genero</h3>
                                <p>Animation, Action, Adventure.</p>
                            </div>
                            <div>
                                <h3>Trama</h3>
                                <p>Sigue las aventuras de Monkey D. Luffy y su tripulación pirata para encontrar el tesoro más grande que jamás haya dejado el legendario pirata Gold Roger. El famoso tesoro misterioso llamado \"One Piece\"</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form runat="server">
            <br />
            <div class="mx-auto col-md-6 text-center">
                <h2 class="text-center">Listado de peliculas</h2>
            </div>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col align-self-end">
                        <asp:Button runat="server" ID="BtnCreate" CssClass="btn btn-success form-control-sm" Text="+Agregar" OnClick="BtnCreate_Click" />
                    </div>
                    <div class="col align-self-end">
                        <asp:Button runat="server" ID="BtnCreateA" CssClass="btn btn-primary form-control-sm" Text="Actores" OnClick="BtnCreateA_Click" />
                    </div>
                    <div class="col align-self-end">
                        <asp:Button runat="server" ID="BtnCreateD" CssClass="btn btn-dark form-control-sm" Text="Directores" OnClick="BtnCreateD_Click" />
                    </div>
                </div>
            </div>
            <br />
            <div class="container">
                <div class="table small">
                    <asp:GridView runat="server" ID="gvpeliculas" class="table table-borderless table-hover">
                        <Columns>
                            <asp:TemplateField HeaderText="Opciones del admin">
                                <ItemTemplate>

                                    <asp:Button runat="server" Text="Ver" CssClass="btn form-control-sm btn-info" ID="BtnRead" OnClick="BtnRead_Click" />
                                    <asp:Button runat="server" Text="Update" CssClass="btn form-control-sm btn-warning" ID="BtnUpdate" OnClick="BtnUpdate_Click" />
                                    <asp:Button runat="server" Text="Delete" CssClass="btn form-control-sm btn-danger" ID="BtnDelete" OnClick="BtnDelete_Click" />

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </form>
    </section>
</asp:Content>


