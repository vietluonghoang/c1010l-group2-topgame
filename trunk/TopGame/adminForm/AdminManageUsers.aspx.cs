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
    public partial class AdminManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Convert.ToInt32(Session["role"].ToString()) > 2)
                {
                    if (!IsPostBack)
                    {
                        Databind();
                        LoadLabelRole();
                        Visiblelbt();

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
           
            Page.Form.DefaultButton = Button1.UniqueID;
        }


        private void Databind()
        {

            Binding bind = new Binding();
            if (TextBox1.Text != null)
            {
                GridView1.DataSource = bind.getData("select * from tblUser where role!=3 and email like '%" + TextBox1.Text.ToString() + "%'");
                GridView1.DataBind();


            }
            else
            {
                GridView1.DataSource = bind.getData("select * from tblUser where role!=3");
                GridView1.DataBind();

            }
            bind.Connection.Close();

        }


        private void LoadLabelRole()
        {

            for (int i = 0; i < GridView1.Rows.Count;i++ )
            {
                Label lbRole = (Label)GridView1.Rows[i].FindControl("lbRole");

                if(lbRole.Text.Equals("1"))
                {
                    lbRole.Text = "Member";
                }
                else if (lbRole.Text.Equals("2"))
                {
                    lbRole.Text = "Moderator";
                }          

            }
        
        }

      
      


        private void Visiblelbt()
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                Label lbRole = (Label)GridView1.Rows[i].FindControl("lbRole");

                if (lbRole.Text.Equals("Member"))
                {
                    GridView1.Rows[i].FindControl("lbtMember").Visible = false;
                }
                else if (lbRole.Text.Equals("Moderator"))
                {
                    GridView1.Rows[i].FindControl("lbtModerator").Visible = false;
                }

                Label lbStatus = (Label)GridView1.Rows[i].FindControl("lbStatus");

                if (lbStatus.Text.Equals("True"))
                {
                    GridView1.Rows[i].FindControl("lbtActive").Visible = false;
                }
                else if (lbStatus.Text.Equals("False"))
                {
                    GridView1.Rows[i].FindControl("LbtDeactive").Visible = false;
                }

            }
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
                       
                        LoadLabelRole();
                        Visiblelbt();
                        break;
                    case "Deactive":
                        Deactive(index);
                        Databind();
                        
                        LoadLabelRole();
                        Visiblelbt();
                        break;

                    case "Member":
                        Member(index);
                        Databind();
                         LoadLabelRole();
                        Visiblelbt();

                        break;

                    case "Moderator":
                        Moderator(index);
                        Databind();
                         LoadLabelRole();
                        Visiblelbt();

                        break;
                }
            }
        }

        private void Active(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());

            GridViewRow row = GridView1.Rows[index];



            Label lbStatus = (Label)row.FindControl("lbStatus");


            if (lbStatus.Text.Equals("False"))
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                int status = 1;
                String strSQL = "UPDATE tblUser SET status = " + status + " where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();
            }
        }

        private void Deactive(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());
            GridViewRow row = GridView1.Rows[index];

            Label lbStatus = (Label)row.FindControl("lbStatus");




            if (lbStatus.Text.Equals("True"))
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                int status = 0;
                String strSQL = "UPDATE tblUser SET status = " + status + " where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();

            }
        }

        private void Member(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());
            GridViewRow row = GridView1.Rows[index];

            Label lbRole = (Label)row.FindControl("lbRole");




            if (lbRole.Text.Equals("Moderator"))
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                int role = 1;
                String strSQL = "UPDATE tblUser SET role = " + role + " where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();

            }
        }

        private void Moderator(int index)
        {
            int a = Convert.ToInt32(GridView1.DataKeys[index].Values["id"].ToString());
            GridViewRow row = GridView1.Rows[index];

            Label lbRole = (Label)row.FindControl("lbRole");




            if (lbRole.Text.Equals("Member"))
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                int role = 2;
                String strSQL = "UPDATE tblUser SET role = " + role + " where id=" + a;
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Databind();
            LoadLabelRole();
            Visiblelbt();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Databind();
            LoadLabelRole();
            Visiblelbt();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }
    }
}