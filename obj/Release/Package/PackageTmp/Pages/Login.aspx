<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CrudCine.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <section class="bg-dark login">
        <div class="row g-0">
            <div class="izquierda col-md-7 text-center my-auto">
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
            <div class="col-lg-5 bg-dark d-flex flex-column align-items-end min-vh-100">
                <div class="px-lg-5 pt-lg-4 pb-lg-3 p-4 mb-auto w-100">
                </div>
                <div class="align-self-center w-100 px-lg-5 py-lg-4 p-4">
                    <h1 class="font-weight-bold mb-4">Bienvenido de vuelta</h1>
                    <form id="formulario_login" runat="server" class="mb-5">
                        <div class="mb-4">
                            <asp:Label runat="server" ID="lblUsuario" CssClass="form-label" text="Usuario"></asp:Label>
                            <asp:TextBox runat="server" ID="tbUsuario" CssClass="form-control" placeholder="Ingresa tu Usuario"></asp:TextBox>
                        </div>
                        <div class="mb-4">
                            <asp:Label ID="lblPassword" runat="server" CssClass="form-label" Text="Contraseña"></asp:Label>
                            <asp:TextBox TextMode="Password" ID="tbPassword" runat="server" CssClass="form-control" placeholder="Ingresa tu contraseña"></asp:TextBox>
                            <a href="#" id="emailHelp" class="form-text text-light secondary-color text-decoration-none">¿Has olvidado tu contraseña?</a>
                        </div>
                        <div class="row">
                            <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                        </div>
                        <br/>
                        <asp:Button runat="server" class="btn btn-danger w-100" ID="BtnIniciar" OnClick="BtnIniciar_Click" Text="Iniciar sesión"></asp:Button>
                    </form>

                    <p class="font-weight-bold text-center secondary-color">O inicia sesión con</p>
                    <div class="d-flex justify-content-around">
                        <button type="button" class="btn btn-outline-light flex-grow-1 mr-2"><i class="fab fa-google lead mr-2"></i>Google</button>
                        <button type="button" class="btn btn-outline-light flex-grow-1 ml-2"><i class="fab fa-facebook-f lead mr-2"></i>Facebook</button>
                    </div>
                </div>
                <div class="text-center px-lg-5 pt-lg-3 pb-lg-4 p-4 mt-auto w-100">
                    <p class="d-inline-block mb-0">¿Todavia no tienes una cuenta?</p>
                    <a href="#" class="text-light font-weight-bold text-decoration-none">Crea una ahora</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
