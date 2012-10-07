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
    public partial class AdminManageImages : System.Web.UI.Page
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
            string id = Request.QueryString["gameId"];
            GridView1.DataSource = bind.getData("select * from gameImage where gameId="+id);
            GridView1.DataBind();
            bind.Connection.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminManageGame.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Databind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Databind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != String.Empty)
            {
                int index = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName.ToString())
                {
                    case "UpdateComponent":
                        UpdateImage(index);
                        Databind();
                      
                        break;
                    case "DeleteComponent":
                        DeleteImage(index);
                        Databind();
                   
                        break;
    
                }
            }
        }
      

        private void UpdateImage(int index)
        {

            string id = Request.QueryString["gameId"];
            Image img = (Image)GridView1.Rows[index].FindControl("Image1");
            FileUpload fu = (FileUpload) GridView1.Rows[index].FindControl("FileUpload1");


            string saveDir = @"\upload\images\";
            string appPath = Request.PhysicalApplicationPath;


            if (fu.HasFile)
            {
                string savePath = appPath + saveDir + Server.HtmlEncode(fu.FileName);
                string pos = saveDir + Server.HtmlEncode(fu.FileName);


                fu.SaveAs(savePath);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();

            

                String strSQL = "update gameImage set imageFile='"+pos+"' where gameId="+id+" and imageFile='"+img.ImageUrl+"'";
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();

            }


        }



        private void DeleteImage(int index)
        {

            string id = Request.QueryString["gameId"];

            Image img = (Image)GridView1.Rows[index].FindControl("Image1");
            

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "delete gameImage where gameId="+Convert.ToInt32(id)+" and imageFile ='" + img.ImageUrl + "'";
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();
        
        }

        protected void lbtnInsertComponent_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["gameId"];

            string saveDir = @"\upload\images\";
            string appPath = Request.PhysicalApplicationPath;

            

            if (FileUpload2.HasFile)
            {
                string savePath = appPath + saveDir + Server.HtmlEncode(FileUpload2.FileName);
                string pos = saveDir + Server.HtmlEncode(FileUpload2.FileName);


                FileUpload2.SaveAs(savePath);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "insert into gameImage values(" + id + ",'" + pos + "')";
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();

            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Databind();
        }
    }
}