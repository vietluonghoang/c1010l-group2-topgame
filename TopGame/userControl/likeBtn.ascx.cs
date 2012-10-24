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
        protected int _gameId;

        public int GameId
        {
            get { return _gameId; }
            set { _gameId = value; }
        }

        protected int _userId;

        public int UserId
        {
            get { return _userId; }
            set { _userId = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["id"] != null)
                {
                    UserId = Convert.ToInt32(Session["id"]);
                }
            }
        }


        protected void ImageButtonLike_Click(object sender, ImageClickEventArgs e)
        {
            Binding bind = new Binding();
            SqlDataReader rd = bind.getDataReader("select * from userLike where gameId = " + GameId + " and userId = " + UserId);
            if (!rd.HasRows)
            {
                bind.executeQry("insert into userLike values(" + GameId + "," + UserId + ")");
                bind.executeQry("update game set totalLike = totalLike + 1 where id = " + GameId);
            }
            loadLikeBtn();
        }

        protected void ImageButtonUnlike_Click1(object sender, ImageClickEventArgs e)
        {
            Binding bind = new Binding();
            SqlDataReader rd = bind.getDataReader("select * from userLike where gameId = " + GameId + "and userId =" + UserId);
            if (rd.HasRows)
            {
                bind.executeQry("delete from userLike where gameId = " + GameId + " and userId = " + UserId);
                bind.executeQry("update game set totalLike = totalLike - 1 where id = " + GameId);
            }
            loadLikeBtn();
        }

        public void loadLikeBtn()
        {
                Binding bind = new Binding();
                SqlDataReader rd = bind.getDataReader("select * from userLike where gameId = " + GameId + "and userId =" + UserId);
                
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
                rd = bind.getDataReader("select * from game where id=" + GameId);
                rd.Read();
                lblLike.Text = Convert.ToString(rd.GetInt64(9));
                lblLike.DataBind();
            
        }
    }
}