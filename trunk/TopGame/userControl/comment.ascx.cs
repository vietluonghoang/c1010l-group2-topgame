using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;

namespace Assignment.userControl
{
    public partial class comment : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getComment();
            if(Session["id"]!=null)
            {
                
            }
            
        }

        protected void getComment()
        {
            int gameId = Convert.ToInt32(Request.QueryString["gameId"].ToString());
            Binding bind = new Binding();
            GridView1.DataSource = bind.getData("select comment.*, tblUser.userName, tblUser.avaFile from comment, tblUser where comment.userId = tblUser.id and comment.status = 1 and comment.gameId = " + gameId + " order by comment.postTime desc");
            GridView1.ShowHeader = false;
            GridView1.BorderWidth = 0;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int gameId =Convert.ToInt32( Request.QueryString["gameId"].ToString());
            int userId =Convert.ToInt32( Session["id"].ToString());
            String time = DateTime.Now.ToString();
            Binding bind = new Binding();
            bind.executeQry("insert into comment values("+gameId+","+userId+",'"+TextBox1.Text+"','"+time+"','true')");
            getComment();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            getComment();
        }
    }
}