﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Actores.aspx.cs" Inherits="CrudCine.Pages.Actores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Actores
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form class="index fondo" runat="server">
        <br />
        <div class="mx-auto" style="width:300px">
            <h2>Listado de Actores</h2>
        </div>
        <br />
        <div class="container">
            <div class="row">
                <div class="col align-self-end">
                    <asp:Button runat="server" ID="BtnCreate" CssClass="btn btn-success form-control-sm" Text="Peliculas" OnClick="BtnCreate_Click"/>
                </div>
                <div class="col align-self-end">
                    <asp:Button runat="server" ID="BtnCreateA" CssClass="btn btn-primary form-control-sm" Text="+Agregar" OnClick="BtnCreateA_Click"/>
                </div>
                <div class="col align-self-end">
                    <asp:Button runat="server" ID="BtnCreateD" CssClass="btn btn-dark form-control-sm" Text="Directores" OnClick="BtnCreateD_Click"/>
                </div>
            </div>
        </div>
         <br />
        <div class="container">
            <div class="table small">               
                <asp:GridView runat="server"  ID="gvactores" class="table table-borderless table-hover">
                    <Columns>
                        <asp:TemplateField HeaderText="Opciones del admin">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Ver" CssClass="btn form-control-sm btn-info" ID="BtnRead" OnClick="BtnRead_Click"/>
                                <asp:Button runat="server" Text="Update" CssClass="btn form-control-sm btn-warning" ID="BtnUpdate" OnClick="BtnUpdate_Click"/>
                                <asp:Button runat="server" Text="Delete" CssClass="btn form-control-sm btn-danger" ID="BtnDelete" OnClick="BtnDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>  
            </div>
        </div>
    </form>
</asp:Content>
