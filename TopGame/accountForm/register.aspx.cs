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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            con.Open();
            SqlCommand cm = new SqlCommand("select count(*) from tblUser where email='" + TextBox1.Text + "'", con);
            int gender = 0;
            int count = Convert.ToInt32(cm.ExecuteScalar().ToString());
            if (count >= 1)
            {
                Label7.Text = "This email already exists";
            }
            else
            {
                if (RadioButton1.Checked)
                {
                    gender = 0;
                }
                else if (RadioButton2.Checked)
                {
                    gender = 1;
                }

                cm.CommandText = "insert into tblUser values('" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox1.Text + "'," + gender + ",'/upload/avatar/defaultAva.jpg',1,1)";
                cm.ExecuteNonQuery();

                 cm.CommandText = "select userName,id,role from tblUser where email='" + TextBox1.Text + "'";
                cm.ExecuteNonQuery();
                SqlDataReader dr = cm.ExecuteReader();
                while (dr.Read())
                {
                    
                    string uName = Convert.ToString(dr.GetSqlString(0));
                    int id = dr.GetInt32(1);
                    int role = dr.GetInt32(2);

                Session["id"] = id;
                Session["role"] = role;
                Session["uName"] = uName;
                Response.Redirect("../Default.aspx");
                }
                

             
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 6)
            {
                args.IsValid = false;
            }
            else
                args.IsValid = true;
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Label6.Text = "";
            Label7.Text = "";
            Label8.Text = "";
            Label9.Text = "";
            RadioButton1.Checked = true;
            RadioButton2.Checked = false;
        }
    }
}