using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        
        SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CNS_SYSTEMConnectionString"].ConnectionString);
        String C_Name;
        byte[] salt = new byte[128 / 8] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
        

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect(Request.RawUrl);
            // Session.Abandon();
            //Session["CName"] = null;
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            //Response.Cache.SetNoStore();
            if (!IsPostBack)
            {
                
             //   Session["CName"] = null;
                connection.Open();
                //String query = "SELECT CustodianName FROM Custodian";
                //SqlCommand command = new SqlCommand(queryString, connection);
                //SqlCommand cmd = new SqlCommand(query, connection);
                //SqlDataReader dr = cmd.ExecuteReader();
                //SqlDataAdapter adpt = new SqlDataAdapter(query, connection);
                //DataTable dt = new DataTable();
                //adpt.Fill(dt);
                //txtUserName.DataSource = dt; //put name of dropdown
                //txtUserName.DataBind();


                txtUserName.DataSource = SqlDataSource1;
                txtUserName.DataTextField = "CustodianName";
                txtUserName.DataValueField = "CustodianId";
                txtUserName.DataBind();
                //txtUserName.Items.Insert(0, new ListItem("Username", "NA"));
                txtUserName.Items.Insert(0, new ListItem("Admin", "Admin"));

                connection.Close();
            }
        }

        protected void UserName(object sender, EventArgs e)
        {

        }

        protected void Password(object sender, EventArgs e)
        {

        }

        protected void getPasswordHash()
        {
            connection.Open();

            String q1 = "SELECT Password FROM CUSTODIAN";
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = connection.CreateCommand();
            cmd.CommandText = q1;
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    foreach (DataColumn column in table.Columns)
                    {
                        String pass = row[column].ToString();
                        /*using (var rng = RandomNumberGenerator.Create())
						{
							rng.GetBytes(salt);
						}*/
                        System.Security.Cryptography.Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(pass, salt, 10000);
                        String hashed = Convert.ToBase64String(rfc2898DeriveBytes.GetBytes(256 / 8));
                        String q2 = "UPDATE Custodian SET Password = '" + hashed + "' WHERE Password='" + pass + "'";
                        SqlCommand command = new SqlCommand(q2, connection);
                        command.ExecuteNonQuery();
                    }
                }
            }
            connection.Close();

        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //string message = ddlFruits.SelectedItem.Text + " - " + ddlFruits.SelectedItem.Value;
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
            //C_Name = ;
        }


        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            C_Name = txtUserName.SelectedItem.Text;
            //byte[] salt = new byte[128 / 8];
            /*using (var rng = RandomNumberGenerator.Create())
			{
				rng.GetBytes(salt);
			}*/
            //getPasswordHash();
            //Console.WriteLine($"Salt: {Convert.ToBase64String(salt)}");

            // derive a 256-bit subkey (use HMACSHA1 with 10,000 iterations)

            System.Security.Cryptography.Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(txtPassword.Text, salt, 10000);
            String hashed = Convert.ToBase64String(rfc2898DeriveBytes.GetBytes(256 / 8));
            //Response.Write(hashed);
            String query = "SELECT Password FROM Custodian WHERE CustodianName ='" + txtUserName.SelectedItem.Text + "' AND Password = '" + hashed + "'";
            connection.Open();
            SqlCommand cmd = new SqlCommand(query, connection);


            using (SqlDataReader dr = cmd.ExecuteReader())
            {

                if (dr.Read()|| (txtUserName.SelectedItem.Text=="Admin" && txtPassword.Text=="Admin"))
                {
                    //Response.Write("<script>alert('Login Successful');</script>");
                    if((txtUserName.SelectedItem.Text == "Admin" && txtPassword.Text == "Admin"))
                    {
                        Session["CName"] = "Admin";
                        Server.Transfer("Admin.aspx", true);
                    }
                        
                    else
                    {
                        Session["CName"] = txtUserName.SelectedItem.Text;
                        Server.Transfer("Custodian.aspx", true);
                    }
                    
                }
                else
                {

                    Response.Write("<script>alert('Login Not Successful');</script>");
                }

            }


            //rfc2898DeriveBytes = new Rfc2898DeriveBytes(dr.GetString(0), salt, 10000);
            //String hashed1 = Convert.ToBase64String(rfc2898DeriveBytes.GetBytes(256 / 8));
            //String query = "SELECT Password FROM Custodian WHERE CustodianName = '" + C_Name + "'";



            connection.Close();
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}