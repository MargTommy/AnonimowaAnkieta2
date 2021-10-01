using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnonimowaAnkieta
{
    public partial class questionnaire : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                using (anonymusAtqEntities dbcontect = new anonymusAtqEntities())
                {
                    
                    ddlScale.DataSource = (from scale_numbers in dbcontect.scale_numbers
                                           select new fksclaenumber
                                           {
                                               fkid_number = scale_numbers.id_number,
                                               fknumber = scale_numbers.number
                                           }).ToList();
                    ddlScale.DataValueField = "fkid_number";
                    ddlScale.DataTextField = "fknumber";
                    ddlScale.DataBind();
                }
            }
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {           
            
            if (Page.IsValid)
            {
                using (anonymusAtqEntities dbcontect = new anonymusAtqEntities())
                {

                   record survrecord = new record();
                   survrecord.id_number = Convert.ToInt32(ddlScale.SelectedValue);
                   survrecord.SRTFeedback = tbSTRFeed.Text;
                   survrecord.answ = Convert.ToBoolean(ddlTF.SelectedValue);
                   dbcontect.records.Add(survrecord);
                   dbcontect.SaveChanges();
                }
                Response.Redirect("~/About");
            }
            else
            {
                valSumm.Visible = true;

            }
        }
    }
}