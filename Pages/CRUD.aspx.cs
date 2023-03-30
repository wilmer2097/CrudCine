using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Security.Cryptography;

namespace CrudCine.Pages
{
    public partial class CRUD : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        public static string sID = "-1";
        public static string sOpc = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Obtener el id
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"]!=null)
                {
                    sID = Request.QueryString["id"].ToString();
                    CargarDatos();
                }
                if (Request.QueryString["op"]!= null)
                {
                    sOpc = Request.QueryString["op"].ToString();

                    switch (sOpc)
                    {
                        case "C":
                            this.lbltitulo.Text = "Ingresar nueva pelicula";
                            this.BtnCreate.Visible = true;
                            break;
                        case "R":
                            this.lbltitulo.Text = "Consulta de pelicula";
                            break;
                        case "U":
                            this.lbltitulo.Text = "Modificar pelicula";
                            this.BtnUpdate.Visible = true;
                            break;
                        case "D":
                            this.lbltitulo.Text = "Eliminar pelicula";
                            this.BtnDelete.Visible = true;
                            break;

                    }
                }
            }
        }
        
        void CargarDatos()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("sp_BuscarPeli", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@Id_pel", SqlDbType.Int).Value = sID;
            DataSet ds = new DataSet();
            ds.Clear();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            DataRow row = dt.Rows[0];
            tbnombre.Text = row[1].ToString();
            tbaño.Text = row[2].ToString();
            tbduracion.Text = row[3].ToString();
            tbgenero.Text = row[4].ToString();
            tbdirector.Text = row[5].ToString();
            tbactores.Text = row[6].ToString();
            tbfoto.ImageUrl = row[7].ToString();
            con.Close();

        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_CrearPeli", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = tbnombre.Text;
            cmd.Parameters.Add("@Año", SqlDbType.VarChar).Value = tbaño.Text;
            cmd.Parameters.Add("@Dur", SqlDbType.VarChar).Value = tbduracion.Text;
            cmd.Parameters.Add("@Gen", SqlDbType.VarChar).Value = tbgenero.Text;
            cmd.Parameters.Add("@Dir", SqlDbType.VarChar).Value = tbdirector.Text;
            cmd.Parameters.Add("@Act", SqlDbType.VarChar).Value = tbactores.Text;
            cmd.Parameters.Add("@Fot", SqlDbType.VarChar).Value = tbfoto.ImageUrl;
            cmd.ExecuteNonQuery();
            con.Close() ;
            Response.Redirect("index.aspx");
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_actualizarPeli", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id_pel", SqlDbType.Int).Value = sID;
            cmd.Parameters.Add("@Nom", SqlDbType.VarChar).Value = tbnombre.Text;
            cmd.Parameters.Add("@Año", SqlDbType.VarChar).Value = tbaño.Text;
            cmd.Parameters.Add("@Dur", SqlDbType.VarChar).Value = tbduracion.Text;
            cmd.Parameters.Add("@Gen", SqlDbType.VarChar).Value = tbgenero.Text;
            cmd.Parameters.Add("@Dir", SqlDbType.VarChar).Value = tbdirector.Text;
            cmd.Parameters.Add("@Act", SqlDbType.VarChar).Value = tbactores.Text;
            cmd.Parameters.Add("@Fot", SqlDbType.VarChar).Value = tbfoto.ImageUrl;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("index.aspx");
        }


        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_deletePeli", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id_pel", SqlDbType.Int).Value = sID;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("index.aspx");
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
 
}