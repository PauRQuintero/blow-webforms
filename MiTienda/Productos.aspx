<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="MiTienda.Productos" Culture="es-AR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Nuestros productos</h2>

<div class="input-group mb-4" style="max-width: 500px;">
    <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
    <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="¿Qué estás buscando?" />
    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-marca" />
</div>

<asp:GridView ID="gvProductos" runat="server"
    DataSourceID="sdsProductos" DataKeyNames="Id"
    AutoGenerateColumns="False" AllowSorting="True"
    AllowPaging="True" PageSize="5"
    CssClass="table table-hover tabla-productos"
    EmptyDataText="No se encontraron productos.">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Código" SortExpression="Id" />
        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
        <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" DataFormatString="{0:C}"
            ItemStyle-CssClass="precio" HeaderStyle-CssClass="precio" />
        <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
    </Columns>
</asp:GridView>

<asp:SqlDataSource ID="sdsProductos" runat="server"
    ConnectionString="<%$ ConnectionStrings:TiendaDB %>"
    SelectCommand="SELECT Id, Nombre, Descripcion, Precio, Stock FROM Productos
                   WHERE Nombre LIKE '%' + @buscar + '%'">
    <SelectParameters>
        <asp:ControlParameter Name="buscar" ControlID="txtBuscar" PropertyName="Text"
            DefaultValue="" ConvertEmptyStringToNull="False" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
