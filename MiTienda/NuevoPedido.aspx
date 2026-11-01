<%@ Page Title="Hacer un pedido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoPedido.aspx.cs" Inherits="MiTienda.NuevoPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="row justify-content-center">
    <div class="col-lg-6">
        <div class="card border-0 shadow-sm p-4">

            <h2 class="mb-4">Hacer un pedido</h2>

            <asp:ValidationSummary ID="vsResumen" runat="server" CssClass="alert alert-danger"
                HeaderText="Revisá los siguientes campos:" />
            <asp:Label ID="lblMensaje" runat="server" />

            <div class="mb-3">
                <label class="form-label">Nombre y apellido</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombre"
                    ErrorMessage="El nombre es obligatorio." Text="*" CssClass="text-danger" />
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="El email es obligatorio." Text="*" CssClass="text-danger" Display="Dynamic" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    ErrorMessage="El email no tiene un formato válido." Text="*" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="mb-3">
                <label class="form-label">Teléfono</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefono"
                    ErrorMessage="El teléfono es obligatorio." Text="*" CssClass="text-danger" />
            </div>

            <div class="mb-3">
                <label class="form-label">Producto</label>
                <asp:DropDownList ID="ddlProducto" runat="server" CssClass="form-select"
                    DataSourceID="sdsProductos" DataTextField="Nombre" DataValueField="Id"
                    AppendDataBoundItems="True">
                    <asp:ListItem Text="-- Seleccioná un producto --" Value="0" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlProducto" InitialValue="0"
                    ErrorMessage="Tenés que elegir un producto." Text="*" CssClass="text-danger" />
            </div>

            <div class="mb-4">
                <label class="form-label">Cantidad</label>
                <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCantidad"
                    ErrorMessage="La cantidad es obligatoria." Text="*" CssClass="text-danger" Display="Dynamic" />
                <asp:RangeValidator runat="server" ControlToValidate="txtCantidad" Type="Integer"
                    MinimumValue="1" MaximumValue="100"
                    ErrorMessage="La cantidad debe estar entre 1 y 100." Text="*" CssClass="text-danger" Display="Dynamic" />
            </div>

            <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar pedido"
                CssClass="btn btn-marca w-100" OnClick="btnConfirmar_Click" />

        </div>
    </div>
</div>

<asp:SqlDataSource ID="sdsProductos" runat="server"
    ConnectionString="<%$ ConnectionStrings:TiendaDB %>"
    SelectCommand="SELECT Id, Nombre FROM Productos ORDER BY Nombre" />
</asp:Content>
