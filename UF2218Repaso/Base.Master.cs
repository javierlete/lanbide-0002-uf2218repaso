using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UF2218Repaso
{
    public partial class Base : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            /* Abandon session object to destroy all session variables */
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            
            Response.Redirect("~/Login.aspx");
        }
    }
}