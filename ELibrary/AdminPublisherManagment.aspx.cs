using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ELibrary
{
    public partial class AdminPublisherManagment : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            
        }
        //add
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
            {
                Response.Write("<script> alert('id already exist we cannot add publisher with same id'); </script>");

            }
            else
            {
                AddPublisher();
            }
        }
        //update
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
            {

                UpdatePublisher();
            }
            else
            {

                Response.Write("<script> alert('id not found insert valid id '); </script>");
            }

        }
        //delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
            {

                DeletePublisher();
            }
            else
            {

                Response.Write("<script> alert('id not found insert valid id '); </script>");
            }

        }
        //go
        protected void Button2_Click(object sender, EventArgs e)
        {
            PublisherById();

        }
        void PublisherById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from publisher_master_tbl where publisher_id='" + textBox1.Text.Trim() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    textBox3.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script> alert(' Invalid Publisher ID'); </script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");

            }
        }

        bool CheckMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from publisher_master_tbl where publisher_id='" + textBox1.Text.Trim() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

                //Response.Write("<script>alert('Author Added'); </script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }
        void AddPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into publisher_master_tbl(publisher_id,publisher_name)values(@author_id,@author_name) ", con);
                cmd.Parameters.AddWithValue("@author_id", textBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", textBox3.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Added'); </script>");
                clearForm();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void clearForm()
        {
            textBox1.Text = "";
            textBox3.Text = "";
        }
        void UpdatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name=@author_name where publisher_id='" + textBox1.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@author_name", textBox3.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('UPDATE SUCCESSFULLY'); </script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void DeletePublisher()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM publisher_master_tbl where publisher_id='" + textBox1.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('DELETE SUCCESSFULLY'); </script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        
    }
}