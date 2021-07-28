<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UF2218Repaso.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1 class="display-1">Listado de películas</h1>
    <asp:ObjectDataSource ID="PeliculasDataSource" runat="server" SelectMethod="ObtenerTodas" TypeName="UF2218Repaso.Daos.PeliculaDao"></asp:ObjectDataSource>
    <asp:Repeater ID="PeliculasRepeater" runat="server" DataSourceID="PeliculasDataSource">
        <HeaderTemplate>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 row-cols-xxl-6 g-4">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="col">
                <div class="card h-100">
                    <asp:Image runat="server" ImageUrl='<%# Eval("Id", "~/fotos/{0}.jpg") %>' CssClass="card-img-top ratio-4x3" AlternateText='<%# Eval("Titulo", "Foto de {0}") %>' />
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("Titulo") %></h5>
                        <p class="card-text"><%# Eval("Fecha") %></p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted"><%# Eval("Id") %></small>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>

