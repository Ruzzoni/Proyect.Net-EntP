using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

namespace ProyectoFinalBios2019
{
    public partial class MP : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Empleado empLogeado = (Empleado)Session["Empleado"];

                if (!(Session["Empleado"] is Empleado))
                {
                    lblEmpleado.Text = "";
                    Menu1.Visible = false;
                }

                else if (Session["Empleado"] is Empleado)
                {
                    lblEmpleado.Text = empLogeado._NombreEmp;
                    Menu1.Visible = true;
                }
            }
            catch
            {
                Response.Redirect("Principal.aspx");
            }
        }
    }
}