<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiTienda._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <section class="portada">
    <div>
        <p class="bajada mb-2">Bienvenido a Blow.</p>
        <h1>Equipos para trabajar y jugar, elegidos uno por uno.</h1>
        <p class="bajada">Probamos cada notebook, monitor y periférico antes de venderlo. Si no lo usaríamos nosotros, no está en la tienda.</p>
        <a runat="server" href="~/Productos" class="btn btn-marca btn-lg">Ver productos</a>
    </div>

    <article class="ficha" aria-label="Producto destacado">
        <h2 class="ficha-nombre">Notebook Pro 14</h2>
        <p class="ficha-uso">Para programar, estudiar y editar fotos.</p>
        <dl>
            <dt>Procesador</dt><dd>Intel Core i7</dd>
            <dt>Memoria</dt><dd>16 GB RAM</dd>
            <dt>Almacenamiento</dt><dd>512 GB SSD</dd>
            <dt>Garantía</dt><dd>12 meses oficial</dd>
        </dl>
        <div class="ficha-precio">$ 1.250.000</div>
        <p class="ficha-cuotas">o 6 cuotas sin interés de $ 208.333</p>
        <a runat="server" href="~/NuevoPedido" class="btn btn-outline-dark">Pedir esta notebook</a>
    </article>
</section>

<section class="ventajas">
    <div>
        <h3>Garantía oficial</h3>
        <p>12 meses en todos los equipos. Si algo falla, lo gestionamos nosotros con el fabricante.</p>
    </div>
    <div>
        <h3>Envío en el día</h3>
        <p>Comprando antes de las 13 h, lo recibís hoy mismo.</p>
    </div>
    <div>
        <h3>Cuotas sin interés</h3>
        <p>Hasta 6 cuotas con todas las tarjetas de crédito.</p>
    </div>
</section>

</asp:Content>