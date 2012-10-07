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
            Binding bind = new Binding();
            SqlDataReader rd = bind.getDataReader("select top(1) * from game order by totalLike desc");
            rd.Read();
            String videoSrc = rd.GetString(4);
            videoDiv.InnerHtml = "<iframe id=\"embedYoutube\" runat=\"server\" width=\"590\" height=\"375\" src=\"http://www.youtube.com/embed/" + videoSrc + "?autoplay=1&showinfo=0&showsearch=0&rel=0\" frameborder=\"0\" allowfullscreen></iframe>";
            videoDiv.DataBind();
            rd = bind.getDataReader("select top(2) * from category where status = 'true'");
            rd.Read();
            HomeGame1.Title = rd.GetString(1);
            HomeGame1.Qry = "select top(4)* from game where status = 'true' and categoryId =" + rd.GetInt32(0);
            HomeGame1.showData();
            HomeGame1.DataBind();
            rd.Read();
            HomeGame2.Title = rd.GetString(1);
            HomeGame2.Qry = "select top(4)* from game where status = 'true' and categoryId =" + rd.GetInt32(0);
            HomeGame2.showData();
            HomeGame2.DataBind();
            bind.Connection.Close();
        }
    }
}