using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;

namespace Assignment.userControl
{
    public partial class HomeGame : System.Web.UI.UserControl
    {
        String qry;

        public String Qry
        {
            get { return qry; }
            set { qry = value; }
        }

        String title;

        public String Title
        {
            get { return title; }
            set { title = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void showData()
        {
            Binding bind = new Binding();
            Label2.Text = title;
            DataList1.DataSource = bind.getData(qry);
            DataList1.DataBind();
            bind.Connection.Close();
        }
    }
}