using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using TopGame.Services;

namespace Assignment
{
    public partial class AdminManageComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Convert.ToInt32(Session["role"].ToString()) > 1)
                {
                    if (!IsPostBack)
                    {
                        Databind();
                        LoadControl();
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
           
        }
        private void Databind()
        {
            Binding bind = new Binding();
            GridView1.DataSource = bind.getData("select * from comment");
            GridView1.DataBind();
            bind.Connection.Close();
        }


        private void LoadControl()
        {
            for (int i = 0; i < GridView1.Rows.Count;i++ )
            {
                Label lbgame = (Label)GridView1.Rows[i].FindControl("Label1");
                Label lbemail = (Label)GridView1.Rows[i].FindControl("Label2");
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();
                String strSQL = "select gameName from game where id=" + Convert.ToInt32(lbgame.Text);
                SqlCommand cm = new SqlCommand(strSQL, con);
                SqlDataReader dr = cm.ExecuteReader();
                while (dr.Read())
                {
                    string game = Convert.ToString(dr.GetString(0));
                    lbgame.Text = game;
                }
                dr.Close();

                cm.CommandText = "select email from tblUser where id=" + Convert.ToInt32(lbemail.Text);
               

                 dr = cm.ExecuteReader();
                while (dr.Read())
                {
                    string email = Convert.ToString(dr.GetString(0));
                    lbemail.Text = email;
                }

                Label lbStatus = (Label)GridView1.Rows[i].FindControl("Label5");
                if (lbStatus.Text.Equals("True"))
                {
                    GridView1.Rows[i].FindControl("lbtActive").Visible = false;
                }
                else
                {
                    GridView1.Rows[i].FindControl("lbtDeactive").Visible = false;
                }

            }
        
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Databind();
            LoadControl();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != String.Empty)
            {
                int index = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName.ToString())
                {
                    case "Active":
                        Active(index);
                        Databind();
                        LoadControl();
                        break;
                    case "Deactive":
                        Deactive(index);
                        Databind();
                        LoadControl();
                        break;

                   
                }
            }
        }

        private void Active(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());

            GridViewRow row = GridView1.Rows[index];



            Label lbStatus = (Label)row.FindControl("Label5");


            if (lbStatus.Text.Equals("False"))
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                int status = 1;
                String strSQL = "UPDATE comment SET status = " + status + " where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();


            }
        }

        private void Deactive(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());
            GridViewRow row = GridView1.Rows[index];

            Label lbStatus = (Label)row.FindControl("Label5");




            if (lbStatus.Text.Equals("True"))
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                int status = 0;
                String strSQL = "UPDATE comment SET status = " + status + " where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }


       
    }
}