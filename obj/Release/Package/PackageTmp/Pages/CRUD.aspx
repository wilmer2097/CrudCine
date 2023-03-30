<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="CRUD.aspx.cs" Inherits="CrudCine.Pages.CRUD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Formulario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <br />
    <div class=" mx-auto" style="width:250px">
        <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
    </div>

    <form runat="server" class="col-md-12 fondo h-100 d-flex align-items-center justify-content-center">
        <div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" id="tbnombre" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Año</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbaño"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Duracion(minutos)</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbduracion"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Genero</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbgenero"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Director</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbdirector"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Actores</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbactores"></asp:TextBox>

            </div>
            <div class="col-mb-4">
                <label class="form-label">Foto</label>
                <asp:Image runat="server" CssClass="form-control" ID="tbfoto"></asp:Image>
            </div>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnCreate" Text="Create" Visible="false" OnClick="BtnCreate_Click" />
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnUpdate" Text="Update" Visible="false" OnClick="BtnUpdate_Click" />
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnDelete" Text="Delete" Visible="false" OnClick="BtnDelete_Click" />
            <asp:Button runat="server" CssClass="btn btn-primary btn-danger" ID="BtnVolver" Text="Volver" Visible="true" OnClick="BtnVolver_Click" />
        </div>

    </form>

</asp:Content>
