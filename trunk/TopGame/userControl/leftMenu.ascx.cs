using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;

namespace TopGame.userControl
{
    public partial class leftMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Binding bind = new Binding();
            DataList1.DataSource = bind.getData("select * from category");
            DataList1.DataBind();
            bind.Connection.Close();
            if (Session["role"] != null)
            {
                int role = Convert.ToInt32(Session["role"].ToString());
                if (role == 2 || role == 3)
                {
                    MultiView1.SetActiveView(View2);
                }
                else
                {
                    MultiView1.SetActiveView(View1);
                }
            }
        }
    }
}