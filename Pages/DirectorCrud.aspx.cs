﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudCine.Pages
{
    public partial class DirectorCrud : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        public static string sID = "-1";
        public static string sOpc = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    sID = Request.QueryString["id"].ToString();
                    CargarDatos();
                    tbdate.TextMode = TextBoxMode.DateTime;
                }
                if (Request.QueryString["op"] != null)
                {
                    sOpc = Request.QueryString["op"].ToString();

                    switch (sOpc)
                    {
                        case "C":
                            this.lbltitulo.Text = "Ingresar nuevo Director";
                            this.BtnCreate.Visible = true;
                            break;
                        case "R":
                            this.lbltitulo.Text = "Consulta de Director";
                            break;
                        case "U":
                            this.lbltitulo.Text = "Modificar Director";
                            this.BtnUpdate.Visible = true;
                            break;
                        case "D":
                            this.lbltitulo.Text = "Eliminar Director";
                            this.BtnDelete.Visible = true;
                            break;

                    }
                }
            }
        }
        void CargarDatos()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("sp_BuscarDirector", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@Id_dir", SqlDbType.Int).Value = sID;
            DataSet ds = new DataSet();
            ds.Clear();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            DataRow row = dt.Rows[0];
            tbnombre.Text = row[1].ToString();
            tbapellido.Text = row[2].ToString();
            DateTime d = (DateTime)row[3];
            tbdate.Text = d.ToString("dd/MM/yyyy");
            tbnacionalidad.Text = row[4].ToString();
            tbfoto.Text = row[5].ToString();
            con.Close();

        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_CrearDirector", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Nom", SqlDbType.VarChar).Value = tbnombre.Text;
            cmd.Parameters.Add("@Ape", SqlDbType.VarChar).Value = tbapellido.Text;
            cmd.Parameters.Add("@Fecha_Nac", SqlDbType.Date).Value = tbdate.Text;
            cmd.Parameters.Add("@Nac", SqlDbType.VarChar).Value = tbnacionalidad.Text;
            cmd.Parameters.Add("@Foto", SqlDbType.VarChar).Value = tbfoto.Text;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("DirectorCreate.aspx");
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_actualizarDirector", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id_dir", SqlDbType.Int).Value = sID;
            cmd.Parameters.Add("@Nom", SqlDbType.VarChar).Value = tbnombre.Text;
            cmd.Parameters.Add("@Ape", SqlDbType.VarChar).Value = tbapellido.Text;
            cmd.Parameters.Add("@Fecha_Nac", SqlDbType.Date).Value = tbdate.Text;
            cmd.Parameters.Add("@Nac", SqlDbType.VarChar).Value = tbnacionalidad.Text;
            cmd.Parameters.Add("@Foto", SqlDbType.VarChar).Value = tbfoto.Text;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Directores.aspx");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_deleteDirector", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id_dir", SqlDbType.Int).Value = sID;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Directores.aspx");
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Directores.aspx");
        }

    }
}