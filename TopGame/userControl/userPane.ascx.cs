using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using TopGame.Services;

namespace Assignment.userControl
{
    public partial class userPane : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["user"] != null)
                {
                    Session["id"] = Request.Cookies["user"]["id"];
                    Session["uName"] = Request.Cookies["user"]["uName"];
                    Session["role"] = Request.Cookies["user"]["role"];

                }
                getUser();

            }
        }

        protected void getUser()
        {
            if (Session["id"] != null)
            {
                Binding bind = new Binding();
                SqlDataReader rd = bind.getDataReader("select * from tblUser where id = " + Session["id"]);
                if (rd.Read())
                {
                    Label1.Text = Session["uName"].ToString();
                    Image1.ImageUrl = Convert.ToString(rd.GetSqlString(5));
                    MultiView1.ActiveViewIndex = 0;
                    MultiView1.DataBind();
                }
            }
            else
            {
                MultiView1.ActiveViewIndex = 1;
                MultiView1.DataBind();
            }

        }

        protected void lBtnLogout_Click(object sender, EventArgs e)
        {
            int role = Convert.ToInt32( Session["role"]);
            
            if (Session["id"] != null)
            {
                Session["id"] = null;
                Session["uName"] = null;
                Session["role"] = null;
            }

            if (Request.Cookies["user"] != null)
            {
                HttpCookie myCookie = new HttpCookie("user");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
            }

            getUser();
            if (role>1)
            {
                Response.Redirect("../Default.aspx");
            }
        }



        protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        {
            Binding bind = new Binding();
            SqlDataReader rd = bind.getDataReader("select * from tblUser where email = '" + Login1.UserName + "'");
            if (rd.Read())
            {
                string userName = rd.GetString(1);
                string pass = rd.GetString(2);
                int id = rd.GetInt32(0);
                int role = rd.GetInt32(6);
                if (Login1.Password == pass)
                {
                    Session["uName"] = userName;
                    Session["id"] = id;
                    Session["role"] = role;

                    if (Login1.RememberMeSet)
                    {
                        HttpCookie hc = new HttpCookie("user");
                        hc["uName"] = userName;
                        hc["pass"] = pass;
                        hc["id"] = id.ToString();
                        hc["role"] = role.ToString();
                        hc.Expires = DateTime.Now.AddDays(1);
                        Response.Cookies.Add(hc);
                    }
                    UpdatePanelUser.Update();
                    getUser();
                    getUser();
                    if (role > 1)
                    {
                        Response.Redirect("/adminForm/AdminManageGame.aspx");
                    }
                }
                else
                {
                    Login1.FailureText = "invalid password !";
                    Login1.DataBind();
                }
            }
            else
            {
                Login1.FailureText = "User is not exist !";
                Login1.DataBind();
            }
        }
    }
}