<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="CrudCine.Pages.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <br />
    <div class="position-relative">
        <br />
        <br />
       
        <div class="mb-12 todo text-center">
             <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
            <div class="text-center mx-auto"></div>
            <input type="text" id="movie-name" placeholder="Ingrese la pelicula aqui..." value="">
            <button id="search-btn" class="btn btn-warning">search</button><div id="result"></div>
        </div>
    </div>
    <script>
        let movieNameRef = document.getElementById("movie-name");
        let searchBtn = document.getElementById("search-btn");
        let result = document.getElementById("result");
        var textBox = document.getElementById("movie-name");
        //mostrar con enter
        textBox.addEventListener("keyup", function (event) {
            if (event.key == 13) {
                getMovie();
                console.log("aqui enter")
            }
        });
        //función para obtener datos de api
        key = "8c74b0c3";
        let getMovie = () => {
            let movieName = movieNameRef.value;
            let url = `https://www.omdbapi.com/?t=${movieName}&apikey=${key}`;
            //si el campo de entrada está vacío

            if (movieName.length <= 0) {
                result.innerHTML = `<h3  class="msg"></h3>`;
            }
            else {
                fetch(url).then((resp) => resp.json()).then((data) => {
                    //si la película existe en la base de datos
                    console.log(data);
                    if (data.Response == "True") {
                        result.innerHTML = `
                    
                    <form runat="server" class="h-100 d-flex align-items-center justify-content-center">
        <div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbnombre" value="${data.Title}"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Año</label>
                <asp:TextBox runat="server" CssClass="form-control" value="${data.Year}" ID="tbaño"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Duracion(minutos)</label>
                <asp:TextBox runat="server" CssClass="form-control" value="${data.Runtime}" ID="tbduracion"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Genero</label>
                <asp:TextBox runat="server" CssClass="form-control" value="${data.Genre}" ID="tbgenero"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Director</label>
                <asp:TextBox runat="server" CssClass="form-control" value="${data.Director}" ID="tbdirector"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Actores</label>
                <asp:TextBox runat="server" CssClass="form-control" value="${data.Actors}" ID="tbactores" ></asp:TextBox>

            </div>
            <div class="mb-3">
                <label class="form-label">Foto</label>
                <asp:TextBox runat="server" CssClass="form-control" value="${data.Poster}" ID="tbfoto"></asp:TextBox>
            </div>
            <div>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnCreate" Text="Create" Visible="false" Onclick="BtnCreate_Click" />
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnUpdate" Text="Update" Visible="false" OnClick="BtnUpdate_Click" />
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnDelete" Text="Delete" Visible="false" OnClick="BtnDelete_Click" />
            <asp:Button runat="server" CssClass="btn btn-primary btn-dark" ID="BtnVolver" Text="Volver" Visible="true" OnClick="BtnVolver_Click" />
            </div>

    </form>
`;
                    }

                    //si la película no existe en la base de datos
                    else {
                        result.innerHTML = `<h3 class="msg">${data.Error}</h3>`;
                    }
                })
                    //si ocurre un error
                    .catch(() => {
                        result.innerHTML = `<h3 class="msg">Ocurrió un error</h3>`;
                    });
            }
        };

        searchBtn.addEventListener("click", getMovie);
        window.addEventListener("load", getMovie);
    </script>
</asp:Content>