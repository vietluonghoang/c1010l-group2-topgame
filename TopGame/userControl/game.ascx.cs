using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;
using System.Data.SqlClient;

namespace Assignment.userControl
{
    public partial class game : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int gameId = Convert.ToInt32(Request.QueryString["gameId"]);
            Binding bind = new Binding();
            DataList1.DataSource = bind.getData("select top(3)* from gameImage where gameId =" + gameId + " order by NEWID()");
            DataList1.DataBind();
            SqlDataReader rd = bind.getDataReader("select * from game where id=" + gameId);
            rd.Read();
            String videoSrc = rd.GetString(4);
            gameTrailer.InnerHtml = "<iframe id=\"embedYoutube\" runat=\"server\" width=\"580\" height=\"375\" src=\"http://www.youtube.com/embed/" + videoSrc + "?autoplay=1&showinfo=0&showsearch=0&rel=0\" frameborder=\"0\" allowfullscreen></iframe>";
            gameTrailer.DataBind();
            Label1.Text = rd.GetString(1);
            Label2.Text = rd.GetString(3);
            Label3.Text = Convert.ToString(rd.GetInt64(6));
            likeBtn1.LblLike = Label3;
            likeBtn1.loadLikeBtn();
        }

    }
}