using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class AddTrades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CNAme"] == null)
                Server.Transfer("SignIn.aspx", true);
        }

    

        protected void AddTrade_Click(object sender, EventArgs e)
        {
            string y = BMemName.SelectedItem.Text;
            string z= SMemName.SelectedItem.Text;
            //Checking bmemname and smemname equality
            if (BMemName.SelectedItem.Text.Equals(SMemName.SelectedItem.Text))
            {
                Response.Write("<script language=javascript>alert('Buying Member Name cannot be same as Selling Member Name.')</script>");

               
        }
            else
            {
                using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CNS_SYSTEMConnectionString"].ConnectionString))
                {
                    //conn.ConnectionString = "<%$ ConnectionStrings:CNS_SYSTEMConnectionString %>";
                    conn.Open();

                    int Tradecount = 0;
                    string TradeCount;
                    string countsql = $"select count(TradeID) from TradeListDynamic";

                    SqlCommand commandcount = new SqlCommand(countsql, conn);

                    using (SqlDataReader dr = commandcount.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            Tradecount = dr.GetInt32(0);
                        }

                    }

                    Tradecount++;
                    TradeCount = Tradecount.ToString();




                    string sql = @"Insert into TradeListDynamic values ('" + Tradecount + "','" + SecName2.SelectedItem.Text + "'," + Int32.Parse(Qty.Text) + "," + Double.Parse(Price.Text) + ",'" + BMemName.SelectedItem.Text + "','" + SMemName.SelectedItem.Text + "')";
                    using (SqlCommand command = new SqlCommand(sql, conn))
                    {
                        command.ExecuteNonQuery();
                    }
                }

                Response.Write("<script language=javascript>alert('Trade Added.')</script>");
                SMemName.SelectedIndex = 0;
                BMemName.SelectedIndex = 0;
                SecName2.SelectedIndex = 0;
                Qty.Text = "";
                Price.Text = "";
                //Response.Redirect(Request.RawUrl);
            }
        }

        protected void BMemName_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }


        //Response.Redirect(Request.RawUrl);



    }
}



    



        