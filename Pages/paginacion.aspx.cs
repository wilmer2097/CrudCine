//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace CrudCine.Pages
//{
//    public partial class paginacion : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            // Verificar si hay un parámetro de género en la URL y agregarlo al SqlDataSource si es necesario
//            string genero = Request.QueryString["genero"];
//            if (!string.IsNullOrEmpty(genero))
//            {
//                SqlDataSource1.SelectParameters.Add("genero", genero);
//            }

//            // Obtener el número de página actual y el tamaño de página
//            int paginaActual = 1;
//            int tamanoPagina = 10; // Mostrar 10 películas por página
//            if (!string.IsNullOrEmpty(Request.QueryString["pagina"]))
//            {
//                paginaActual = int.Parse(Request.QueryString["pagina"]);
//            }

//            // Obtener el total de películas y calcular el número total de páginas
//            int totalPeliculas = (int)SqlDataSource1.Select(DataSourceSelectArguments.Empty).TotalRowCount;
//            int totalPaginas = (int)Math.Ceiling((double)totalPeliculas / tamanoPagina);

//            // Configurar el control de paginación
//            rptPagination.Visible = totalPaginas > 1;
//            rptPagination.DataSource = Enumerable.Range(1, totalPaginas);
//            rptPagination.DataBind();

//            // Calcular el índice inicial y el número de películas a mostrar
//            int indiceInicial = (paginaActual - 1) * tamanoPagina;
//            int numPeliculas = Math.Min(tamanoPagina, totalPeliculas - indiceInicial);

//            // Configurar el control Repeater de películas
//            SqlDataSource1.SelectParameters["startRowIndex"].DefaultValue = indiceInicial.ToString();
//            SqlDataSource1.SelectParameters["maximumRows"].DefaultValue = numPeliculas.ToString();
//            rptPeliculas.DataSource = SqlDataSource1;
//            rptPeliculas.DataBind();
//        }

//    }
//}