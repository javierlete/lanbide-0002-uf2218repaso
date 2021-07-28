<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="UF2218Repaso.admin.Listado" UnobtrusiveValidationMode="None" %>

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

    <asp:FormView RenderOuterTable="false" DefaultMode="Insert" ID="FormularioFormView" runat="server" DataSourceID="FormularioDataSource">
        <EditItemTemplate>
            <div class="row mb-3">
                <asp:Label CssClass="col-sm-2 col-form-label" ID="IdLabel" runat="server" Text="Id:" AssociatedControlID="IdTextBox"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label CssClass="col-sm-2 col-form-label" ID="TituloLabel" runat="server" Text="Título:" AssociatedControlID="TituloTextBox"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="form-control" ID="TituloTextBox" runat="server" Text='<%# Bind("Titulo") %>' />
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label CssClass="col-sm-2 col-form-label" ID="FechaLabel" runat="server" Text="Fecha:" AssociatedControlID="FechaTextBox"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox Text='<%# Bind("Fecha", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control" ID="FechaTextBox" runat="server" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-10 offset-sm-2">
                    <asp:LinkButton CssClass="btn btn-primary" runat="server" CommandName="Update" Text="Guardar" />
                    &nbsp;<asp:LinkButton CssClass="btn btn-danger" runat="server" CommandName="Cancel" Text="Cancelar" />
                </div>
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row mb-3">
                <asp:Label CssClass="col-sm-2 col-form-label" ID="TituloLabel" runat="server" Text="Título:" AssociatedControlID="TituloTextBox"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="form-control" ID="TituloTextBox" runat="server" Text='<%# Bind("Titulo") %>' />
                    <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ErrorMessage="Se debe introducir un título" ControlToValidate="TituloTextBox" runat="server" ValidationGroup="InsertarGroup" />
                    <asp:RegularExpressionValidator Display="Dynamic" CssClass="text-danger" ControlToValidate="TituloTextBox" ValidationExpression="\w{5,50}" runat="server" ErrorMessage="El título debe tener entre 5 y 50 caracteres" ValidationGroup="InsertarGroup"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row mb-3">
                <asp:Label CssClass="col-sm-2 col-form-label" ID="FechaLabel" runat="server" Text="Fecha:" AssociatedControlID="FechaTextBox"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox Display="Dynamic" TextMode="Date" CssClass="form-control" ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
                    <asp:RangeValidator Display="Dynamic" CssClass="text-danger" CultureInvariantValues="false" Type="Date" ControlToValidate="FechaTextBox" MinimumValue="1800-01-01" MaximumValue="<%# DateTime.Today.ToShortDateString() %>" ID="FechaRangeValidator" runat="server" ErrorMessage="La fecha no puede ser posterior a hoy ni anterior a 1800" ValidationGroup="InsertarGroup"></asp:RangeValidator>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-10 offset-sm-2">
                    <asp:LinkButton CssClass="btn btn-primary" ID="LinkButton1" runat="server" CommandName="Insert" Text="Insertar" ValidationGroup="InsertarGroup" />
                    &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="LinkButton2" runat="server" CommandName="Cancel" Text="Cancelar" />
                </div>
            </div>
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
