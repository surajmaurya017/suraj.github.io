using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary
{
    public partial class AdminAuthorManagment : System.Web.UI.Page
    {
        string strcon= ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //Add button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
            {
                Response.Write("<script> alert('id already exist we cannot add author with same id'); </script>");
                
            }
            else
            {
                AddAuthor();
            }

        }
        //update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
            {

                UpdateAuthor();
            }
            else
            {
                
                Response.Write("<script> alert('id not found insert valid id '); </script>");
            }
        }
        //delete button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
            {

                DeleteAuthor();
            }
            else
            {

                Response.Write("<script> alert('id not found insert valid id '); </script>");
            }
        }
        //go button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            AuthorById();
        }
        void AuthorById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from author_master_tbl where author_id='" + textBox1.Text.Trim() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    textBox3.Text = dt.Rows[0][1].ToString();            
                }
                else
                {
                    Response.Write("<script> alert(' Invalid Author ID'); </script>");
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
                SqlCommand cmd = new SqlCommand("select * from author_master_tbl where author_id='" + textBox1.Text.Trim()+ "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count>=1)
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
        void AddAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into author_master_tbl(author_id,author_name)values(@author_id,@author_name) ", con);
                cmd.Parameters.AddWithValue("@author_id", textBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", textBox3.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Added'); </script>");
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
        void UpdateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name=@author_name where author_id='"+textBox1.Text.Trim()+"'", con);
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
        void DeleteAuthor()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl where author_id='" + textBox1.Text.Trim() + "'", con);
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