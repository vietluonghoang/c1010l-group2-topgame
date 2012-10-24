using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;
using System.Data.SqlClient;

namespace Assignment
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"]!=null)
            {
                if (Convert.ToInt32(Session["role"]) > 1)
                {
                    Response.Redirect("/adminForm/AdminManageGame.aspx");
                }
            }
            Binding bind = new Binding();
            SqlDataReader rd = bind.getDataReader("select top(1) * from game order by totalLike desc");
            rd.Read();
            String videoSrc = rd.GetString(4);
            videoDiv.InnerHtml = "<iframe id=\"embedYoutube\" runat=\"server\" width=\"620\" height=\"425\" src=\"http://www.youtube.com/embed/" + videoSrc + "?autoplay=1&showinfo=0&showsearch=0&rel=0\" frameborder=\"0\" allowfullscreen></iframe>";
            videoDiv.DataBind();
            rd = bind.getDataReader("select top(2) * from category where status = 'true'");
            rd.Read();
        }
    }
}