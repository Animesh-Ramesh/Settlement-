using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CNAme"] == null)
                Server.Transfer("SignIn.aspx", true);

            //using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CNS_SYSTEMConnectionString"].ConnectionString))
            //{
            //    //conn.ConnectionString = "<%$ ConnectionStrings:CNS_SYSTEMConnectionString %>";
            //    conn.Open();

            //    int 
            //    string TradeCount;
            //    string countsql = $"select count(TradeID) from TradeListDynamic";

            //    SqlCommand commandcount = new SqlCommand(countsql, conn);

            //    using (SqlDataReader dr = commandcount.ExecuteReader())
            //    {
            //        if (dr.Read())
            //        {
            //            Tradecount = dr.GetInt32(0);
            //        }

            //    }
            //}

        }  
    }
}