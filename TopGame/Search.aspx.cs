using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.SearchService;
using System.Data;

namespace TopGame
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchService.GameServiceClient client = new GameServiceClient();
            GameDataSet ds = new GameDataSet();
            ds = client.GetGameByName(txtSearch.Text);
            DataTable dt = new DataTable();
            dt = ds.Games.Tables[0];
            listGame1.setData(dt);
            listGame1.DataBind();
        }
    }
}