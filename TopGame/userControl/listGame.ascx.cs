using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;
using Assignment.userControl;
using System.Drawing;
using System.Data;

namespace TopGame.userControl
{
    public partial class listGame : System.Web.UI.UserControl
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.ShowHeader = false;
            GridView1.BorderColor = Color.Transparent;
        }

        public void showData(String q)
        {
            Binding bind = new Binding();
            GridView1.DataSource = bind.getData(q);
            GridView1.DataBind();
            bind.Connection.Close();
        }

        public void setData(DataTable dt)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}