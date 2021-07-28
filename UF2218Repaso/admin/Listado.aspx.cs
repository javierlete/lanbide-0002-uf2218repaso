using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UF2218Repaso.admin
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListadoGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormularioFormView.ChangeMode(FormViewMode.Edit);
        }

        protected void RefrescarListadoGridView(object sender, ObjectDataSourceStatusEventArgs e)
        {
            ListadoGridView.DataBind();
        }
    }
}