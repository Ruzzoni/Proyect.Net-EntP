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
    public partial class ABMEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                this.LimpioFormulario();
            }
        }
        private void ActivoBotonesA()
        {
            BtnModificarEmp.Enabled = false;
            BtnEliminarEmp.Enabled = false;
            BtnAgregarEmp.Enabled = true;
            BtnBuscar.Enabled = false;
            RfvPassword.Enabled = true;
            RfvNombre.Enabled = true;
            TboxCi.Enabled = false;
            TboxNomEmp.Enabled = true;
            TboxPassword.Enabled = true;
        }
        private void ActivoBotonesBM()
        {
            BtnModificarEmp.Enabled = true;
            BtnEliminarEmp.Enabled = true;
            BtnAgregarEmp.Enabled = false;
            BtnBuscar.Enabled = false;
            TboxCi.Enabled = false;
            TboxNomEmp.Enabled = true;
            TboxPassword.Enabled = true;
            RfvPassword.Enabled = true;
            RfvNombre.Enabled = true;

        }
        private void LimpioFormulario()
        {
            BtnAgregarEmp.Enabled = false;
            BtnModificarEmp.Enabled = false;
            BtnEliminarEmp.Enabled = false;
            BtnBuscar.Enabled = true;
            TboxCi.Enabled = true;
            TboxNomEmp.Enabled = false;
            TboxPassword.Enabled = false;
            RfvCI.Enabled = true;
            RfvPassword.Enabled = false;
            RfvNombre.Enabled = false;

            TboxCi.Text = "";
            TboxPassword.Text = "";
            TboxNomEmp.Text = "";
            lblError.Text = "";
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                int _Login = Convert.ToInt32(TboxCi.Text.Trim());            
                Empleado _objeto = (Empleado)Logica.LogicaEmpleado.BuscarEmpleado(_Login);

                if (_objeto == null)
                {
                    this.ActivoBotonesA();
                    Session["AMBEmpleados"] = null;
                }
                else
                {
                    this.ActivoBotonesBM();
                    Session["AMBEmpleados"] = _objeto;
                    TboxPassword.Text = _objeto._Password.ToString();
                    TboxNomEmp.Text = _objeto._NombreEmp.ToString();
                    List<Solicitud> buscaEmp = Logica.LogicaSolicitud.ListarSolis();
                    foreach (Solicitud emp in buscaEmp)
                    {
                        if (emp._Emp._Ci == _Login)
                        {
                            BtnEliminarEmp.Enabled = false;
                        }
                    
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void BtnAgregarEmp_Click(object sender, EventArgs e)
        {
            try
            {
                Empleado unE = new Empleado(Convert.ToInt32(TboxCi.Text.Trim()), TboxPassword.Text.Trim(), TboxNomEmp.Text.Trim());

                Logica.LogicaEmpleado.Agregar(unE);

                this.LimpioFormulario();

                lblError.Text = "Empleado agregado con exito.";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void BtnModificarEmp_Click(object sender, EventArgs e)
        {
            try
            {
                Empleado unE = (Empleado)Session["AMBEmpleados"];
                unE._Password = TboxPassword.Text.Trim();
                unE._NombreEmp = TboxNomEmp.Text.Trim();
                unE._Ci = Convert.ToInt32(TboxCi.Text.Trim());

                Logica.LogicaEmpleado.Modificar(unE);
                this.LimpioFormulario();
                lblError.Text = "Modificacion con éxito";

            }
            catch (Exception ex)
            {
                this.LimpioFormulario();
                lblError.Text = ex.Message;
            }
        }

        protected void BtnEliminarEmp_Click(object sender, EventArgs e)
        {
            Empleado unE = (Empleado)Session["AMBEmpleados"];
            try
            {
                Logica.LogicaEmpleado.Eliminar(unE);
                this.LimpioFormulario();
                lblError.Text = "Eliminacion con éxito";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }          
        }

        protected void BtnLimpio_Click(object sender, EventArgs e)
        {
            this.LimpioFormulario();
        }
    }
}