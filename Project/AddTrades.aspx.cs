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
            //  temp();
         //   String x = "chirag";
        }

        protected void AddTrade_Click(object sender, EventArgs e)
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


                string sql = @"Insert into TradeListDynamic values ('" + Tradecount + "','" + SecurityName.Text + "'," + Int32.Parse(Qty.Text) + "," + Double.Parse(Price.Text) + ",'" + BMemName.SelectedItem.Text + "','" + SMemName.SelectedItem.Text + "')";
                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.ExecuteNonQuery();
                }
            }
        }

     
            //Response.Redirect(Request.RawUrl);
        
    }
}



    



        