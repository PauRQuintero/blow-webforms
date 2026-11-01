using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MiTienda
{
    public partial class NuevoPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            // 1. Validación del lado del servidor
            if (!Page.IsValid)
                return;

            // 2. Leer la cadena de conexión del Web.config
            string cadena = ConfigurationManager.ConnectionStrings["TiendaDB"].ConnectionString;

            string sql = @"INSERT INTO Pedidos (ProductoId, NombreCliente, Email, Telefono, Cantidad)
                           VALUES (@ProductoId, @Nombre, @Email, @Telefono, @Cantidad)";

            try
            {
                // 3. Abrir la conexión y ejecutar el INSERT
                using (SqlConnection conexion = new SqlConnection(cadena))
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.AddWithValue("@ProductoId", int.Parse(ddlProducto.SelectedValue));
                    comando.Parameters.AddWithValue("@Nombre", txtNombre.Text.Trim());
                    comando.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    comando.Parameters.AddWithValue("@Telefono", txtTelefono.Text.Trim());
                    comando.Parameters.AddWithValue("@Cantidad", int.Parse(txtCantidad.Text));

                    conexion.Open();
                    comando.ExecuteNonQuery();
                }

                // 4. Avisar al usuario y limpiar el formulario
                lblMensaje.CssClass = "alert alert-success d-block";
                lblMensaje.Text = "¡Pedido registrado con éxito!";
                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "alert alert-danger d-block";
                lblMensaje.Text = "No se pudo registrar el pedido: " + ex.Message;
            }
        }

        private void LimpiarFormulario()
        {
            txtNombre.Text = "";
            txtEmail.Text = "";
            txtTelefono.Text = "";
            txtCantidad.Text = "";
            ddlProducto.SelectedIndex = 0;
        }
    }
}