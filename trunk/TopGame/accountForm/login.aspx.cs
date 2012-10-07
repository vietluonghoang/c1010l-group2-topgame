using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TopGame
{
    public partial class loginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["account"] != null)
            {
                email.Text = Request.Cookies["account"]["email"].ToString();
                password.Attributes.Add("value", Request.Cookies["account"]["password"].ToString());
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 6)
            {
                args.IsValid = false;
            }
            else
                args.IsValid = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            con.Open();
            SqlCommand cm = new SqlCommand("select count(*) from tblUser where email='" + email.Text + "'", con);

            int count = Convert.ToInt32(cm.ExecuteScalar().ToString());

            if (count >= 1)
            {
                cm.CommandText = "select password,userName,id,role,status from tblUser where email='" + email.Text + "'";
                cm.ExecuteNonQuery();
                SqlDataReader dr = cm.ExecuteReader();
                while (dr.Read())
                {
                    
                    bool status=dr.GetBoolean(4);
                    if (status == true)
                    {
                        string pass = Convert.ToString(dr.GetSqlString(0));
                        string uName = Convert.ToString(dr.GetSqlString(1));
                        int id = dr.GetInt32(2);
                        int role = dr.GetInt32(3);
                        if (password.Text.Equals(pass))
                        {
                            if (CheckBox1.Checked)
                            {
                                Response.Cookies["account"]["email"] = email.Text;
                                Response.Cookies["account"]["password"] = password.Text;
                                Response.Cookies["account"].Expires = DateTime.Now.AddDays(30);
                            }
                            Session["uName"] = uName;
                            Session["id"] = id;
                            Session["role"] = role;
                            if (Convert.ToInt32(Session["role"].ToString()) >=2)
                            {
                                Response.Redirect("../adminForm/AdminManageGame.aspx");
                            }
                            else
                            {
                                Response.Redirect("../Default.aspx");
                            }
                        }

                        else
                        {
                            Label5.Text = "Wrong password!!!";

                        }
                    }
                    else
                    {
                        Label4.Text = "Email has been banned";
                    }
                }
            }
            else
            {
                Label4.Text = "Email does not exist!!!";
            }
        }
    }
}