using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace Project
{
    public partial class ObligationReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CNAme"] == null)
                Server.Transfer("SignIn.aspx", true);
        }

        public override void
         VerifyRenderingInServerForm(Control control)
        {
            return;
        }

        protected void ExportToPDF_Click(object sender, EventArgs e)
        {
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    //To Export all pages
                    GridView1.AllowPaging = false;
                    this.DataBind();

                    GridView1.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=SecurityObligationReport.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    GridView1.AllowPaging = true;
                    Response.End();
                    GridView2.RenderControl(hw);
                    StringReader sr2 = new StringReader(sw.ToString());
                    Document pdfDoc2 = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser2 = new HTMLWorker(pdfDoc2);
                    PdfWriter.GetInstance(pdfDoc2, Response.OutputStream);
                    pdfDoc2.Open();
                    htmlparser2.Parse(sr2);
                    pdfDoc2.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=FundsObligationReport.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc2);
                    Response.End();

                    GridView2.AllowPaging = true;

                }
            }

            //using (StringWriter sw = new StringWriter())
            //{
            //    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            //    {
            //        //To Export all pages
            //        GridView2.AllowPaging = false;
            //        this.DataBind();

            //        GridView2.RenderControl(hw);
            //        StringReader sr = new StringReader(sw.ToString());
            //        Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
            //        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //        pdfDoc.Open();
            //        htmlparser.Parse(sr);
            //        pdfDoc.Close();

            //        Response.ContentType = "application/pdf";
            //        Response.AddHeader("content-disposition", "attachment;filename=FundsObligationReport.pdf");
            //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //        Response.Write(pdfDoc);
            //        Response.End();

            //        GridView2.AllowPaging = true;
            //    }


            //}

        }
      


    }
}