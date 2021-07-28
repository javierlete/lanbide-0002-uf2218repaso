<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="UF2218Repaso.admin.Listado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1>Listado</h1>
    <asp:GridView OnSelectedIndexChanged="ListadoGridView_SelectedIndexChanged" CssClass="table table-hover table-striped table-bordered" DataKeyNames="Id" ID="ListadoGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ListadoDataSource" AllowPaging="True">
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

    <asp:FormView DefaultMode="Insert" ID="FormularioFormView" runat="server" DataSourceID="FormularioDataSource">
        <EditItemTemplate>
            Id:
            <asp:TextBox ReadOnly="true" Text='<%# Bind("Id") %>' runat="server" ID="IdTextBox" /><br />
            Titulo:
            <asp:TextBox Text='<%# Bind("Titulo") %>' runat="server" ID="TituloTextBox" /><br />
            Fecha:
            <asp:TextBox TextMode="Date" Text='<%# Bind("Fecha", "{0:yyyy-MM-dd}") %>' runat="server" ID="FechaTextBox" /><br />
            <asp:LinkButton runat="server" Text="Actualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:TextBox ReadOnly="true" Visible="false" Text='0' runat="server" ID="IdTextBox"  /><br />
            Titulo:
            <asp:TextBox Text='<%# Bind("Titulo") %>' runat="server" ID="TituloTextBox" /><br />
            Fecha:
            <asp:TextBox TextMode="Date" Text='<%# Bind("Fecha") %>' runat="server" ID="FechaTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insertar" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            Id:
            <asp:Label Text='<%# Bind("Id") %>' runat="server" ID="IdLabel" /><br />
            Titulo:
            <asp:Label Text='<%# Bind("Titulo") %>' runat="server" ID="TituloLabel" /><br />
            Fecha:
            <asp:Label Text='<%# Bind("Fecha") %>' runat="server" ID="FechaLabel" /><br />
            <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Nuevo" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource OnUpdated="RefrescarListadoGridView" OnInserted="RefrescarListadoGridView" ID="FormularioDataSource" runat="server" DataObjectTypeName="UF2218Repaso.Models.Pelicula" InsertMethod="Insertar" SelectMethod="ObtenerPorId" TypeName="UF2218Repaso.Daos.PeliculaDao" UpdateMethod="Modificar">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListadoGridView" PropertyName="SelectedValue" Name="id" Type="Int64"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
