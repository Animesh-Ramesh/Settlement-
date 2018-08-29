using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CNAme"] == null)
                Server.Transfer("SignIn.aspx", true);
        }

        protected void AddTradesBtn_Click(object sender, EventArgs e)
        {
            //Server.Transfer("AddTrades.aspx");
            Response.Redirect("AddTrades.aspx");
        }

        protected void TruncateTableBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = @"Data Source=GRAD135-HP;Initial Catalog=CNS_SYSTEM;Integrated Security=True";
                conn.Open();

                string sql = $"TRUNCATE table TradeListDynamic";

                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.ExecuteNonQuery();
                }

            }

            Response.Redirect(Request.RawUrl);
        }

        protected void GenRandom_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = @"Data Source=GRAD135-HP;Initial Catalog=CNS_SYSTEM;Integrated Security=True";
                conn.Open();

                string sql = @"update Flags set random=1 where Pkey=1";
                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.ExecuteNonQuery();
                }
                int flag = 0;

                string sqlcheck = @"update Flags set random=0 where random=100";
                do
                {
                    using (SqlCommand command = new SqlCommand(sqlcheck, conn))
                    {
                        flag = command.ExecuteNonQuery();
                    }
                } while (flag.Equals(0));
            }

            
        }
        
    
        protected void SettleBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = @"Data Source=GRAD135-HP;Initial Catalog=CNS_SYSTEM;Integrated Security=True";
                conn.Open();

                string sql = @"update Flags set settlement=1 where Pkey=1";
                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.ExecuteNonQuery();
                }


                int flag = 0;

                string sqlcheck = @"update Flags set settlement=0 where settlement=100";
                do
                {
                    using (SqlCommand command = new SqlCommand(sqlcheck, conn))
                    {
                        flag = command.ExecuteNonQuery();
                    }
                } while (flag.Equals(0));
            }
        }
    }
}