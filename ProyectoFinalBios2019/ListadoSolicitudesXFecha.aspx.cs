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
    public partial class ListadoSolicitudesXFecha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            List<Solicitud> Solis = LogicaSolicitud.ListarSoliXFecha(Calendar1.SelectedDate.Date);
            GridView1.DataSource = Solis;
            GridView1.DataBind();
            lblCodigo.Text = "";
            lblDescripcion.Text = "";
            lblNombre.Text = "";
            lblNom.Text = "";
            lblDireccion.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Solicitud> Solis = LogicaSolicitud.ListarSoliXFecha(Calendar1.SelectedDate);
            foreach (Solicitud sol in Solis)
            {
                lblCodigo.Text = sol._TipoT._CodigoT.ToString();
                lblDescripcion.Text = sol._TipoT._Descripcion.ToString();
                lblNombre.Text = sol._TipoT._Nombre.ToString();
                lblNom.Text = sol._TipoT._EntP._Nombre.ToString();
                lblDireccion.Text = sol._TipoT._EntP._Direccion.ToString();
            }
        }
    }
}