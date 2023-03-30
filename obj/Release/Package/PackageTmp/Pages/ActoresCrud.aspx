<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ActoresCrud.aspx.cs" Inherits="CrudCine.Pages.ActoresCrud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Actores
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <br />
    <div class="mx-auto" style="width:250px">
        <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
    </div>
    <form runat="server" class="h-100 fondo d-flex align-items-center justify-content-center">
        <div>
            <div class="mb-3">
            <label class="form-label">Nombre</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="tbnombre"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbapellido"></asp:TextBox>
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
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnUpdate" Text="Actualizar" Visible="false" OnClick="BtnUpdate_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnDelete" Text="Eliminar" Visible="false" OnClick="BtnDelete_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary btn-dark" ID="BtnVolver" Text="Volver" Visible="true" OnClick="BtnVolver_Click"/>
        </div>
        
    </form>
</asp:Content>
