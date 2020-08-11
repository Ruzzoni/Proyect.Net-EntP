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
    public partial class LoginEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack))
            { Session["Empleado"] = null; }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            RfvCI.Enabled = true;
            RfvPass.Enabled = true;
            try
            {
                Empleado unEmp = LogicaEmpleado.LoginEmp(Convert.ToInt32(TboxUsuario.Text), TboxPassword.Text);
                if (unEmp != null)
                {
                    Session["Empleado"] = unEmp;
                    Response.Redirect("Welcome.aspx");
                }
                else
                    lblError.Text = "Datos Incorrectos";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}