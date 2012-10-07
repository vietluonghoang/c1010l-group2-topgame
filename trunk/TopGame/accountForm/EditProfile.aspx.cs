using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopGame.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace Assignment
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Databind();
                LoadLabelGender();
            }
        }

        private void Databind()
        {
            

            Binding bind = new Binding();
            gvEditAva.DataSource = bind.getData("select * from tblUser where id="+Convert.ToInt32(Session["id"].ToString()));
            gvEditAva.DataBind();

            GridView1.DataSource = bind.getData("select * from tblUser where id="+Convert.ToInt32(Session["id"].ToString()));
            GridView1.DataBind();

            GridView2.DataSource = bind.getData("select * from tblUser where id=" + Convert.ToInt32(Session["id"].ToString()));
            GridView2.DataBind();

            GridView3.DataSource = bind.getData("select * from tblUser where id=" + Convert.ToInt32(Session["id"].ToString()));
            GridView3.DataBind();


            GridView4.DataSource = bind.getData("select * from tblUser where id=" + Convert.ToInt32(Session["id"].ToString()));
            GridView4.DataBind();

            bind.Connection.Close();

        }

        private void LoadLabelGender()
        {

            for (int i = 0; i < GridView4.Rows.Count;i++ )
            {
                Label lb = (Label)GridView4.Rows[i].FindControl("lbGen");

               
               

                if (lb.Text.Equals("0"))
                {
                    lb.Text = "Male";
                }
                else if(lb.Text.Equals("1"))
                {
                    lb.Text = "Female";
                }
               
            }
        
        }

        private void LoadRadioButton()
        {

            for (int i = 0; i < GridView4.Rows.Count; i++)
            {


                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();


                String strSQL = "select gender from tblUser where id=" + Convert.ToInt32(Session["id"].ToString());
                SqlCommand cm = new SqlCommand(strSQL, con);

                SqlDataReader dr = cm.ExecuteReader();
                while (dr.Read())
                {

                    string gen = Convert.ToString(dr.GetString(0));

                    if (gen.Equals("0"))
                    {

                        RadioButton rdMale = (RadioButton)GridView4.Rows[i].FindControl("rdMale");

                        rdMale.Checked = true;

                    }
                    else if (gen.Equals("1"))
                    {
                        RadioButton rdFemale = (RadioButton)GridView4.Rows[i].FindControl("rdFemale");
                        rdFemale.Checked = true;

                    }

                }

                

              

            }
        
        }

        protected void gvEditAva_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEditAva.EditIndex = e.NewEditIndex;
            Databind();
            LoadLabelGender();
        }

        protected void gvEditAva_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEditAva.EditIndex = -1;
            Databind();
            LoadLabelGender();
        }


        protected void gvEditAva_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {


            FileUpload fu = (FileUpload)gvEditAva.Rows[e.RowIndex].FindControl("FileUpload1");


            string saveDir = @"\upload\avatar\";
            string appPath = Request.PhysicalApplicationPath;


            if (fu.HasFile)
            {
                string savePath = appPath + saveDir + Server.HtmlEncode(fu.FileName);
                string pos = saveDir + Server.HtmlEncode(fu.FileName);


                fu.SaveAs(savePath);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "update tblUser set avaFile='" + pos + "' where id=" + Convert.ToInt32(Session["id"].ToString());
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                Databind();
            }
            LoadLabelGender();
        }




        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Databind();
            LoadLabelGender();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Databind();
            LoadLabelGender();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txt = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");

            string pattern = @"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z][a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$";
            Match match = Regex.Match(txt.Text.Trim(), pattern, RegexOptions.IgnoreCase);

            if (match.Success)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "UPDATE tblUser SET email ='" + txt.Text + "' where id=" + Convert.ToInt32(Session["id"].ToString());
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                Databind();

            }
            else
            {
                Label lb = (Label)GridView1.Rows[e.RowIndex].FindControl("Label3");
                lb.Visible = true;
                lb.Text = "Invalid Email";

            }
            LoadLabelGender();
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            Databind();
            LoadLabelGender();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txt = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBox11");

           

            if (txt.Text.Length>=6)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "UPDATE tblUser SET userName ='" + txt.Text + "' where id=" + Convert.ToInt32(Session["id"].ToString());
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                GridView2.EditIndex = -1;
                Databind();

            }
            else
            {
                Label lb = (Label)GridView2.Rows[e.RowIndex].FindControl("Label31");
                lb.Visible = true;
                lb.Text = "Username must be entered >= 6 characters";

            }
            LoadLabelGender();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            Databind();
            LoadLabelGender();
        }

        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView3.EditIndex = e.NewEditIndex;
            Databind();
            LoadLabelGender();
        }

        protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView3.EditIndex = -1;
            Databind();
            LoadLabelGender();
        }

        protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtPass = (TextBox)GridView3.Rows[e.RowIndex].FindControl("TextBox2");
            TextBox txtRePass = (TextBox)GridView3.Rows[e.RowIndex].FindControl("TextBox3");


            if (txtPass.Text.Length >= 6)
            {

                if(txtPass.Text.Equals(txtRePass.Text))
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                    con.Open();



                    String strSQL = "UPDATE tblUser SET userName ='" + txtPass.Text + "' where id=" + Convert.ToInt32(Session["id"].ToString());
                    SqlCommand myCommand = new SqlCommand(strSQL, con);

                    myCommand.ExecuteNonQuery();
                    GridView3.EditIndex = -1;
                    Databind();
                }else
                {
                    Label lb = (Label)GridView3.Rows[e.RowIndex].FindControl("Label8");
                    lb.Visible = true;
                    lb.Text = "Re-type Password and password must be same";
                
                }
            }
            else
            {
                Label lb = (Label)GridView3.Rows[e.RowIndex].FindControl("Label8");
                lb.Visible = true;
                lb.Text = "Password must be entered >= 6 characters";

            }
            LoadLabelGender();
        }

        protected void GridView4_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView4.EditIndex = e.NewEditIndex;
            
            Databind();
        
            LoadRadioButton();
        }

        protected void GridView4_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView4.EditIndex = -1;
            Databind();
            LoadLabelGender();
        }

        protected void GridView4_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            RadioButton rdMale = (RadioButton)GridView4.Rows[e.RowIndex].FindControl("rdMale");
            RadioButton rdFemale = (RadioButton)GridView4.Rows[e.RowIndex].FindControl("rdFemale");

            if (rdMale.Checked)
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "UPDATE tblUser SET gender=0 where id=" + Convert.ToInt32(Session["id"].ToString());
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                GridView4.EditIndex = -1;
                Databind();
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
                con.Open();



                String strSQL = "UPDATE tblUser SET gender=1 where id=" + Convert.ToInt32(Session["id"].ToString());
                SqlCommand myCommand = new SqlCommand(strSQL, con);

                myCommand.ExecuteNonQuery();
                GridView4.EditIndex = -1;
                Databind();
            
            }
            LoadLabelGender();

        }


    }
}
