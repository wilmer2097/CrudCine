
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
    public partial class Login : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void BtnIniciar_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SP_ValidarUsuario", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usuario", SqlDbType.VarChar, 50).Value = tbUsuario.Text;
            cmd.Parameters.Add("@contra", SqlDbType.VarChar, 50).Value = tbPassword.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //Agregamos una sesion de usuario
                Response.Redirect("index.aspx");
            }
            else
            {
                lblError.Text = "Error de usuario o contraseña";
            }
            cmd.Connection.Close();

        }

    }

}