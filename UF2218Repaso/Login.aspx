<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UF2218Repaso.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <div class="row mb-3">
        <asp:Label CssClass="col-sm-2 col-form-label" ID="EmailLabel" runat="server" Text="Email:" AssociatedControlID="EmailTextBox"></asp:Label>
        <div class="col-sm-10">
            <asp:TextBox CssClass="form-control" ID="EmailTextBox" TextMode="Email" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row mb-3">
        <asp:Label CssClass="col-sm-2 col-form-label" ID="PasswordLabel" runat="server" Text="Contraseña:" AssociatedControlID="PasswordTextBox"></asp:Label>
        <div class="col-sm-10">
            <asp:TextBox CssClass="form-control" ID="PasswordTextBox" TextMode="Password" runat="server"></asp:TextBox>
        </div>
    </div>

    <asp:Button ID="LoginButton" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="LoginButton_Click" />

</asp:Content>
