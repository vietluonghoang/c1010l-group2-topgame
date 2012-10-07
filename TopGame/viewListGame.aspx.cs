using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopGame
{
    public partial class viewListGame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String catId = Request.QueryString["catId"];
            listGame1.showData("select * from game where status = 'true' and categoryId = "+catId);
        }
    }
}