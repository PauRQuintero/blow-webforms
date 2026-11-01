# Blow — Tienda online con ASP.NET Web Forms

Desarrollo de una aplicación web multicapa con **ASP.NET Web Forms**, **ADO.NET** y **SQL Server LocalDB**.

**Alumno/a:** Quintero, Paulina Rocio
**Materia:** Programacion de aplicacion distribuidas
**Fecha:** Noviembre 2026

---

## Descripción

Sitio web de una empresa ficticia de venta de productos tecnológicos llamada **Blow**. Permite ver el catálogo de productos (ordenarlo, buscar y paginar) y registrar pedidos de compra, que se guardan en una base de datos SQL Server incluida en el proyecto.

## Requisitos para ejecutarlo

- Visual Studio 2022 con la carga de trabajo **Desarrollo de ASP.NET y web**.
- Componente **Plantillas de proyecto y elementos de .NET Framework**.
- **.NET Framework 4.8**.
- **SQL Server Express LocalDB** (se instala con Visual Studio).

## Cómo ejecutarlo

1. Abrir el archivo `MiTienda.sln` con Visual Studio 2022.
2. Presionar **F5**. Si es la primera vez, Visual Studio restaura los paquetes NuGet automáticamente.
3. Se abre el navegador con la página de inicio.

La base de datos `Tienda.mdf` está en la carpeta `App_Data` y se conecta sola mediante la cadena de conexión `TiendaDB` del archivo `Web.config`. No hace falta instalar ni configurar nada más.

## Funcionalidades (puntos de la consigna)

| Punto | Funcionalidad | Dónde está |
| --- | --- | --- |
| 1 | Visual Studio 2022 habilitado para proyectos Web Forms (.NET Framework) | — |
| 2 | Master Page con logo de la empresa y navegación: Inicio (con mensaje de bienvenida), Productos, Hacer un pedido, Acerca de y Contacto | `Site.Master` (el logo está dibujado en SVG dentro de la página maestra), `Default.aspx`, `About.aspx` |
| 3 | Base de datos SQL Server en `App_Data` con las tablas `Productos` y `Pedidos`, relacionadas y con datos de prueba | `App_Data/Tienda.mdf` |
| 4 | Listado de productos con orden por columnas, búsqueda por nombre y paginación | `Productos.aspx` (`GridView` + `SqlDataSource`) |
| 5 | Alta de pedidos con validación de campos y grabación mediante ADO.NET | `NuevoPedido.aspx` y `NuevoPedido.aspx.cs` (`SqlConnection` + `SqlCommand`) |

## Base de datos

**Productos**

| Campo | Tipo | Detalle |
| --- | --- | --- |
| Id | INT | Clave primaria, autoincremental |
| Nombre | NVARCHAR(100) | Obligatorio |
| Descripcion | NVARCHAR(250) | Opcional |
| Precio | DECIMAL(10,2) | Obligatorio |
| Stock | INT | Obligatorio |

**Pedidos**

| Campo | Tipo | Detalle |
| --- | --- | --- |
| Id | INT | Clave primaria, autoincremental |
| ProductoId | INT | Clave foránea a `Productos.Id` |
| NombreCliente | NVARCHAR(100) | Obligatorio |
| Email | NVARCHAR(100) | Obligatorio |
| Telefono | NVARCHAR(30) | Obligatorio |
| Cantidad | INT | Obligatorio |
| Fecha | DATETIME | Por defecto, la fecha y hora actual |

Relación: un producto puede aparecer en muchos pedidos (uno a muchos).

## Decisiones técnicas

- **Página de productos con `SqlDataSource`:** el listado, el orden y la paginación se resuelven de forma declarativa, sin código C#. La búsqueda usa un parámetro (`@buscar`) vinculado al cuadro de texto.
- **Alta de pedidos con ADO.NET:** el INSERT se programa en el evento del botón con `SqlConnection` y `SqlCommand`, usando bloques `using` para cerrar siempre la conexión.
- **Consultas parametrizadas:** todos los datos que escribe el usuario se envían como parámetros, nunca concatenados en el SQL, para evitar inyección SQL.
- **Validación en dos niveles:** los validadores de ASP.NET (`RequiredFieldValidator`, `RegularExpressionValidator`, `RangeValidator`) actúan en el navegador, y `Page.IsValid` vuelve a validar en el servidor.
- **Diseño:** Bootstrap (incluido en la plantilla) con estilos propios en `Content/Site.css` y la tipografía Archivo de Google Fonts.

## Estructura del proyecto

Archivos creados o modificados en este trabajo:

```
MiTienda/
├── App_Data/
│   └── Tienda.mdf          Base de datos (tablas Productos y Pedidos)
├── Content/
│   └── Site.css            Estilos propios
├── About.aspx              Acerca de
├── Default.aspx            Inicio con mensaje de bienvenida
├── NuevoPedido.aspx        Formulario de pedido
│   └── NuevoPedido.aspx.cs Código del alta con ADO.NET
├── Productos.aspx          Listado de productos
├── Site.Master             Página maestra (logo en SVG, menú y pie)
└── Web.config              Configuración y cadena de conexión
```

El resto de los archivos (`App_Start`, `Scripts`, `Bundle.config`, `Global.asax`, `Contact.aspx`, `Site.Mobile.Master`, `ViewSwitcher.ascx`, `packages.config`) vienen de la plantilla Web Forms de Visual Studio y no fueron modificados.
