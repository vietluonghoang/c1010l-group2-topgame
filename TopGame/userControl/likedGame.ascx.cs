using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;

namespace TopGame.userControl
{
    public partial class likedGame : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Binding bind = new Binding();
            DataList1.DataSource = bind.getData("select top(3) game.id, game.gameName,game.totalLike,game.posterFile, count(comment.gameId) as cm from game, comment where game.id = comment.gameId group by game.id, game.gameName,game.totalLike,game.posterFile order by NEWID()");
            DataList1.DataBind();
            bind.Connection.Close();
        }

        
    }
}