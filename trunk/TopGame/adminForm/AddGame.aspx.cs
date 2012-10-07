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
    public partial class AddGame : System.Web.UI.Page
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

           

            DropDownList1.DataTextField = bind.getData("select id,catName from category").Columns[1].ColumnName;
            DropDownList1.DataValueField = bind.getData("select id,catName from category").Columns[0].ColumnName;

            DropDownList1.DataSource = bind.getData("select id,catName from category");
            DropDownList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string saveDir = @"\upload\images\";
            string appPath = Request.PhysicalApplicationPath;
            if (FileUpload1.HasFile)
            {
                string savePath = appPath + saveDir + Server.HtmlEncode(FileUpload1.FileName);

                FileUpload1.SaveAs(savePath);

                string cat = DropDownList1.SelectedValue;
                string pos = saveDir + Server.HtmlEncode(FileUpload1.FileName);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();
                SqlCommand cm = new SqlCommand("select count(*) from game where gameName='" + TextBox1.Text + "'", con);

                int count = Convert.ToInt32(cm.ExecuteScalar().ToString());

                if (count >= 1)
                {
                    Label21.Text = "This game is already exists";
                }
                else
                {

                    cm.CommandText = "insert into game values('" + TextBox1.Text + "'," + cat + ",'" + TextBox2.Text + "','" + TextBox3.Text + "','" + pos + "',0,getdate(),1)";
                    cm.ExecuteNonQuery();
                    Response.Redirect("AdminManageGame.aspx");

                }
                    
            }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminManageGame.aspx");
        }



    }
}