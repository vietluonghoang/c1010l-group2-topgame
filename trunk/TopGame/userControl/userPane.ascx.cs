using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using TopGame.Services;

namespace Assignment.userControl
{
    public partial class userPane : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uName"] != null)
            {
                Binding bind = new Binding();
                SqlDataReader rd = bind.getDataReader("select * from tblUser where id = " + Session["id"]);
                rd.Read();
                Label1.Text = Session["uName"].ToString();
                Image1.ImageUrl = Convert.ToString(rd.GetSqlString(5));
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                MultiView1.ActiveViewIndex = 1;
            }
            MultiView1.DataBind();
        }

        protected void lBtnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("id");
            Session.Remove("uName");
            Session.Remove("role");
            Response.Redirect("Default.aspx");
        }
    }
}