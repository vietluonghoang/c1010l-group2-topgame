using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class AdminEditGame : System.Web.UI.Page
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
                        VisibleControl();
                        FileUpload1.Visible = false;
                        Button2.Visible = false;
                        
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

        private void LoadPoster()
        {
            string id = Request.QueryString["gameId"];

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            con.Open();


            String strSQL = "select posterFile from game where id="+id;
            SqlCommand cm = new SqlCommand(strSQL, con);

            SqlDataReader dr = cm.ExecuteReader();
            while (dr.Read())
            {
               
                string pos = Convert.ToString(dr.GetString(0));
                Image1.ImageUrl = pos;
            }

        }

        private void Databind()
        {
            Binding bind = new Binding();
            string id = Request.QueryString["gameId"];
            GridView1.DataSource = bind.getData("select * from game where id=" + Convert.ToInt32(id) + "");
            GridView1.DataBind();
            GridView2.DataSource = bind.getData("select * from game where id=" + Convert.ToInt32(id) + "");
            GridView2.DataBind();
            GridView3.DataSource = bind.getData("select * from game where id=" + Convert.ToInt32(id) + "");
            GridView3.DataBind();
            GridView4.DataSource = bind.getData("select * from game where id=" + Convert.ToInt32(id) + "");
            GridView4.DataBind();
            GridView5.DataSource = bind.getData("select * from game where id=" + Convert.ToInt32(id) + "");
            GridView5.DataBind();
            

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {





                DropDownList drop = (DropDownList)GridView2.Rows[i].FindControl("DropDownList1");
                drop.DataTextField = bind.getData("select id,catName from category ").Columns[1].ColumnName;
                drop.DataValueField = bind.getData("select id,catName from category ").Columns[0].ColumnName;

                Label lbCat = (Label)GridView2.Rows[i].FindControl("lbeditcategory");
                drop.SelectedValue = lbCat.Text;


                drop.DataSource = bind.getData("select id,catName from category ");
                drop.DataBind();


                Label lbCategory = (Label)GridView2.Rows[i].FindControl("lbeditcategory");
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();


                String strSQL = "select category.catName from category,game where category.id=" + Convert.ToInt32(lbCategory.Text);
                SqlCommand cm = new SqlCommand(strSQL, con);

                SqlDataReader dr = cm.ExecuteReader();
                while (dr.Read())
                {
                    string cat = Convert.ToString(dr.GetString(0));
                    lbCategory.Text = cat;
                   
                }

            }
            LoadPoster();

            bind.Connection.Close();




        }


        private void VisibleControl()
        {
            VisibleUpdateGameName();
            VisibleUpdateCategory();
            VisibleUpdateTrailer();
            VisibleUpdateDesc();
        }

        private void VisibleEditGameName()
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridView1.Rows[i].FindControl("editgamename").Visible = false;
                GridView1.Rows[i].FindControl("lbeditname").Visible = false;
            }
        }

        private void VisibleUpdateGameName()
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridView1.Rows[i].FindControl("updategamename").Visible = false;
                GridView1.Rows[i].FindControl("txteditname").Visible = false;
            }

        }

        private void VisibleEditCategory()
        {

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                GridView2.Rows[i].FindControl("editcategory").Visible = false;
                GridView2.Rows[i].FindControl("lbeditcategory").Visible = false;
            }
        }

        private void VisibleUpdateCategory()
        {
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                GridView2.Rows[i].FindControl("updatecategory").Visible = false;
                GridView2.Rows[i].FindControl("DropDownList1").Visible = false;
            }

        }


        private void VisibleEditTrailer()
        {

            for (int i = 0; i < GridView4.Rows.Count; i++)
            {
                GridView4.Rows[i].FindControl("edittrailer").Visible = false;
                GridView4.Rows[i].FindControl("lbedittrailer").Visible = false;
            }
        }

        private void VisibleUpdateTrailer()
        {
            for (int i = 0; i < GridView4.Rows.Count; i++)
            {
                GridView4.Rows[i].FindControl("updatetrailer").Visible = false;
                GridView4.Rows[i].FindControl("txtedittrailer").Visible = false;
            }

        }

        private void VisibleEditDesc()
        {

            for (int i = 0; i < GridView5.Rows.Count; i++)
            {
                GridView5.Rows[i].FindControl("editdesc").Visible = false;
                GridView5.Rows[i].FindControl("lbeditdesc").Visible = false;
            }
        }

        private void VisibleUpdateDesc()
        {
            for (int i = 0; i < GridView5.Rows.Count; i++)
            {
                GridView5.Rows[i].FindControl("updatedesc").Visible = false;
                GridView5.Rows[i].FindControl("txteditdesc").Visible = false;
            }

        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != String.Empty)
            {
                int index = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName.ToString())
                {
                    case "editgamename":

                        Databind();
                        VisibleEditGameName();
                        VisibleUpdateCategory();
                        VisibleUpdateTrailer();
                        VisibleUpdateDesc();

                        break;
                    case "updategamename":
                        UpdateGameName(index);
                        Databind();
                        VisibleUpdateGameName();
                        VisibleUpdateCategory();
                        VisibleUpdateTrailer();
                        VisibleUpdateDesc();

                        break;
                }
            }
        }

        private void UpdateGameName(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());

            TextBox txtGameName = (TextBox)GridView1.Rows[index].FindControl("txteditname");

            if (txtGameName.Text != null)
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "UPDATE game SET gameName ='" + txtGameName.Text + "' where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();
            }
        }


        private void UpdateCategory(int index)
        {
            int a = Convert.ToInt32(GridView2.DataKeys[index].Values["id"].ToString());

            DropDownList drop = (DropDownList)GridView2.Rows[index].FindControl("DropDownList1");
            String Cat = drop.SelectedValue;


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            con.Open();



            String strSQL = "UPDATE game SET categoryId =" + Convert.ToInt32(Cat) + " where id=" + a;
            SqlCommand myCommand = new SqlCommand(strSQL, con);

            myCommand.ExecuteNonQuery();
            Databind();

            Label lbCat = (Label)GridView2.Rows[index].FindControl("lbeditcategory");
            lbCat.Text = Cat;

        }

        private void UpdateTrailer(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());

            TextBox txttrailer = (TextBox)GridView4.Rows[index].FindControl("txtedittrailer");

            if (txttrailer.Text != null)
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "UPDATE game SET trailerUrl ='" + txttrailer.Text + "' where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();
            }
        }

        private void UpdateDesc(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());

            TextBox txtdesc = (TextBox)GridView5.Rows[index].FindControl("txteditdesc");

            if (txtdesc.Text != null)
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "UPDATE game SET description ='" + txtdesc.Text + "' where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != String.Empty)
            {
                int index = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName.ToString())
                {
                    case "editcategory":

                        Databind();
                        VisibleEditCategory();
                        VisibleUpdateGameName();
                        VisibleUpdateTrailer();
                        VisibleUpdateDesc();

                        break;
                    case "updatecategory":
                        UpdateCategory(index);
                        Databind();
                        VisibleUpdateCategory();
                        VisibleUpdateGameName();
                        VisibleUpdateTrailer();
                        VisibleUpdateDesc();

                        break;
                }
            }
        }

        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != String.Empty)
            {
                int index = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName.ToString())
                {
                    case "edittrailer":

                        Databind();
                        VisibleEditTrailer();
                        VisibleUpdateCategory();
                        VisibleUpdateGameName();
                        VisibleUpdateDesc();


                        break;
                    case "updatetrailer":
                        UpdateTrailer(index);
                        Databind();
                        VisibleUpdateCategory();
                        VisibleUpdateGameName();
                        VisibleUpdateTrailer();
                        VisibleUpdateDesc();

                        break;
                }
            }
        }
        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != String.Empty)
            {
                int index = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName.ToString())
                {
                    case "editdesc":

                        Databind();
                        VisibleEditDesc();
                        VisibleUpdateTrailer();
                        VisibleUpdateCategory();
                        VisibleUpdateGameName();


                        break;
                    case "updatedesc":
                        UpdateDesc(index);
                        Databind();
                        VisibleUpdateCategory();
                        VisibleUpdateGameName();
                        VisibleUpdateTrailer();
                        VisibleUpdateDesc();

                        break;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminManageGame.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FileUpload1.Visible = true;
            Button2.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["gameId"];

            string saveDir = @"\upload\images\";
            string appPath = Request.PhysicalApplicationPath;


            if (FileUpload1.HasFile)
            {
                string savePath = appPath + saveDir + Server.HtmlEncode(FileUpload1.FileName);
                string pos = saveDir + Server.HtmlEncode(FileUpload1.FileName);


                FileUpload1.SaveAs(savePath);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "update game set posterFile='" + pos + "' where id=" +Convert.ToInt32(id) + " ";
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();

            }
            Button2.Visible = false;
            FileUpload1.Visible = false;
            VisibleUpdateCategory();
            VisibleUpdateGameName();
            VisibleUpdateTrailer();
            VisibleUpdateDesc();
        }


    }
}