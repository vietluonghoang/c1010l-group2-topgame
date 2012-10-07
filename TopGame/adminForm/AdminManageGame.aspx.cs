using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Assignment
{
    public partial class AdminManageGame : System.Web.UI.Page
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
                        Visiblebut();
                        
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
            if (TextBox1.Text!=null)
            {
                GridView1.DataSource = bind.getData("select * from game where gameName like '%" + TextBox1.Text.ToString() + "%'");
                GridView1.DataBind();
               
         
            }
            else
            {
                GridView1.DataSource = bind.getData("select * from game");
                GridView1.DataBind();
               
            }
            bind.Connection.Close();
        }

        private void Visiblebut()
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                Label lbCat = (Label)GridView1.Rows[i].FindControl("lbCategory");
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();


                String strSQL = "select category.catName from category,game where category.id=" + Convert.ToInt32(lbCat.Text);
                SqlCommand cm = new SqlCommand(strSQL, con);

                SqlDataReader dr = cm.ExecuteReader();
                while (dr.Read())
                {
                    string cat = Convert.ToString(dr.GetString(0));
                    lbCat.Text = cat;
                }

                Label lbStatus = (Label)GridView1.Rows[i].FindControl("lbSt");
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
            Visiblebut();
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != String.Empty)
            {
                int index = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName.ToString())
                {
                    case "Active":
                        ActiveGame(index);
                        Databind();
                        Visiblebut();
                        break;
                    case "Deactive":
                        DeactiveGame(index);
                        Databind();
                        Visiblebut();
                        break;

                    case "ImageManage":
                        ManageImage(index);
                        Databind();
                        Visiblebut();
                        break;
                }
            }
        }

        private void ManageImage(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());

            Response.Redirect("AdminManageImages.aspx?gameId=" + a);
        }


        private void ActiveGame(int index)
        {

            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());

            GridViewRow row = GridView1.Rows[index];



            Label lbStatus = (Label)row.FindControl("lbSt");


            if (lbStatus.Text.Equals("False"))
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                int status = 1;
                String strSQL = "UPDATE game SET status = " + status + " where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();


            }


        }

        private void DeactiveGame(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());
            GridViewRow row = GridView1.Rows[index];

            Label lbStatus = (Label)row.FindControl("lbSt");




            if (lbStatus.Text.Equals("True"))
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                int status = 0;
                String strSQL = "UPDATE game SET status = " + status + " where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();

            }



        }

        protected void button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddGame.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Databind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }
    }
}