<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="DirectorCreate.aspx.cs" Inherits="CrudCine.Pages.DirectorCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <br />
    <div class="mb-3">
        <div class="container">
            <div class="search-container">
                <input type="text" id="movie-name" placeholder="Ingrese la pelicula aqui..." value="">
                <button id="search-btn">search</button>
            </div>
            <div id="result"></div>
            <div id="actores-container"></div>
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
                result.innerHTML = `<h3 class="msg">Ingrese un nombre de película</h3>`;
            }
            else {
                fetch(url).then((resp) => resp.json()).then((data) => {

                    //si la película existe en la base de datos
                    console.log(data);
                    if (data.Response == "True") {
                        //nombres de los actores
                        const actorsString = data.Director;
                        const actorsArray = actorsString.split(",");
                        const actoresContainer = document.getElementById("actores-container");
                        actorsArray.forEach(actor => {
                            const actorNombre = actor.trim().split(" ")[0];
                            const actorApellido = actor.trim().split(" ")[1];
                            const actorTitulo = document.createElement("tr");
                            actorTitulo.textContent = `Actor: ${actorNombre} ${actorApellido}`;
                            actoresContainer.appendChild(actorTitulo);
                            result.innerHTML = `
                    
                    <form runat="server" class="h-100 d-flex align-items-center justify-content-center">
        <div>
            <div class="mb-3">
            <label class="form-label">Nombre</label>
            <asp:TextBox runat="server" CssClass="form-control" value="${actorNombre}" ID="tbnombre"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control" value="${actorApellido}" ID="tbapellido"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha de Nacimiento</label>
                <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="tbdate"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Nacionalidad</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbnacionalidad"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Foto</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbfoto"></asp:TextBox>
            </div>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnCreate" Text="Create" Visible="false" OnClick="BtnCreate_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnUpdate" Text="Update" Visible="false" OnClick="BtnUpdate_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnDelete" Text="Delete" Visible="false" OnClick="BtnDelete_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary btn-dark" ID="BtnVolver" Text="Volver" Visible="true" OnClick="BtnVolver_Click"/>
        </div>
        
    </form>
`;
                        });

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
    <div class="mx-auto" style="width: 250px">
        <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
    </div>
</asp:Content>
