using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using TopGame.Services;

namespace TopGame.userControl
{
    public partial class topGamePane : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
        }

        private void getData()
        {
            Binding bind = new Binding();
            DataList1.DataSource = bind.getData("select top 4 * from game where status = 'true' order by totalLike desc");
            DataList1.DataBind();
            bind.Connection.Close();
        }

        protected void Image1_PreRender(object sender, EventArgs e)
        {
            
        }
    }
}