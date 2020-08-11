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
    public partial class ConsultaEstadoSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TBoxNumeroSoli.Text = "";
                RfvNumeroSoli.Enabled = true;
                lblError.Text = "";
            }
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                int NumSoli = Convert.ToInt32(TBoxNumeroSoli.Text.Trim());
                List<Solicitud> _objeto = Logica.LogicaSolicitud.Buscar(NumSoli);

                foreach (Solicitud sol in _objeto)
                {
                    LabelFecha.Text = sol._Fecha.ToString();
                    LabelHora.Text = sol._Hora.ToString();
                    LabelEstado.Text = sol._Estado.ToString();
                    LabelNombre.Text = sol._NombreSolicitante.ToString();
                }
                lblError.Text = "";
                //List<Solicitud> vacio = new List<Solicitud>();
                //GridView1.DataSource = vacio;
                //GridView1.DataBind();

                //    if (_objeto == null)
                //    {
                //        lblError.Text = "No existe una solicitud con este Numero.";
                //    }
                //    else
                //    {
                //        GridView1.DataSource = _objeto;
                //        GridView1.DataBind();
                //    }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}