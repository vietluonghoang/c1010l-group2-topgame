using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;
using Assignment.userControl;

namespace TopGame.userControl
{
    public partial class listGame : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void showData(String q)
        {
            Binding bind = new Binding();
            DataList1.DataSource = bind.getData(q);
            DataList1.DataBind();
            bind.Connection.Close();
        }
    }
}