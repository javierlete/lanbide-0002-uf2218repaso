<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="UF2218Repaso.admin.Listado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1>Listado</h1>
    <asp:GridView CssClass="table table-hover table-striped table-bordered" DataKeyNames="Id" ID="ListadoGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ListadoDataSource" AllowPaging="True">
        <HeaderStyle CssClass="table-dark" />
        <Columns>
            <%--<asp:CommandField ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>--%>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id"></asp:BoundField>
            <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo"></asp:BoundField>
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" DataFormatString="{0:dd-MM-yyyy}"></asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton CssClass="btn btn-primary" CommandName="Select" runat="server" Text="Modificar" />
                    <asp:LinkButton CssClass="btn btn-danger" CommandName="Delete" runat="server" Text="Borrar" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            No se ha encontrado ninguna película
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ListadoDataSource" runat="server" SelectMethod="ObtenerTodas" TypeName="UF2218Repaso.Daos.PeliculaDao" DataObjectTypeName="UF2218Repaso.Models.Pelicula" DeleteMethod="Borrar"></asp:ObjectDataSource>
    
</asp:Content>
