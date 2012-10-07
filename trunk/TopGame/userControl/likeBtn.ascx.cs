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
    public partial class likeBtn : System.Web.UI.UserControl
    {

        Label lblLike;

        public Label LblLike
        {
            get { return lblLike; }
            set { lblLike = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void ImageButtonLike_Click(object sender, ImageClickEventArgs e)
        {
            int gameId = Convert.ToInt32(Request.QueryString["gameId"]);
            int userId = Convert.ToInt32(Session["id"].ToString());
            Binding bind = new Binding();
            SqlDataReader rd = bind.getDataReader("select * from userLike where gameId = " + gameId + "and userId =" + userId);
            if (!rd.HasRows)
            {
                bind.executeQry("insert into userLike values(" + gameId + "," + userId + ")");
                bind.executeQry("update game set totalLike = totalLike + 1 where id = " + gameId);
            }
            loadLikeBtn();
        }

        protected void ImageButtonUnlike_Click1(object sender, ImageClickEventArgs e)
        {
            int gameId = Convert.ToInt32(Request.QueryString["gameId"]);
            int userId = Convert.ToInt32(Session["id"].ToString());
            Binding bind = new Binding();
            SqlDataReader rd = bind.getDataReader("select * from userLike where gameId = " + gameId + "and userId =" + userId);
            if (rd.HasRows)
            {
                bind.executeQry("delete from userLike where gameId = " + gameId + " and userId = " + userId);
                bind.executeQry("update game set totalLike = totalLike - 1 where id = " + gameId);
            }
            loadLikeBtn();
        }

        public void loadLikeBtn()
        {
            if (Session["id"] != null)
            {
                int gameId = Convert.ToInt32(Request.QueryString["gameId"]);
                int userId = Convert.ToInt32(Session["id"].ToString());
                Binding bind = new Binding();
                SqlDataReader rd = bind.getDataReader("select * from userLike where gameId = " + gameId + "and userId =" + userId);
                
                if (rd.HasRows)
                {
                    ImageButtonUnlike.Visible = true;
                    ImageButtonLike.Visible = false;
                }
                else
                {
                    ImageButtonUnlike.Visible = false;
                    ImageButtonLike.Visible = true;
                }
                ImageButtonUnlike.DataBind();
                ImageButtonLike.DataBind();
                rd = bind.getDataReader("select * from game where id=" + gameId);
                rd.Read();
                lblLike.Text = Convert.ToString(rd.GetInt64(6));
                lblLike.DataBind();
            }
        }
    }
}