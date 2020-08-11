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
    public partial class RegistrarSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack))
            {
                GridView1.Enabled = true;
                lblFecha.Visible = false;
                lblHora.Visible = false;
                Calendar1.Visible = false;
                TboxHora.Visible = false;
                lblNombreSolicitante.Visible = false;
                TboxNombreSoli.Visible = false;
                BtnRegistrarSoli.Visible = false;
                lblEntPublica.Visible = false;
                lblEntDireccion.Visible = false;

                List<TipoDeTramite> TipoT = LogicaTipoDeTramite.ListarTodo();
                GridView1.DataSource = TipoT;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Enabled = false;
            lblFecha.Visible = true;
            lblHora.Visible = true;
            Calendar1.Visible = true;
            TboxHora.Visible = true;
            lblNombreSolicitante.Visible = true;
            TboxNombreSoli.Visible = true;
            BtnRegistrarSoli.Visible = true;
            lblEntPublica.Visible = true;
            lblEntDireccion.Visible = true;

            List<TipoDeTramite> TipoT = LogicaTipoDeTramite.ListarTodo();
            string codigo = GridView1.SelectedRow.Cells[1].Text.ToString().Trim();

            foreach (TipoDeTramite nombre in TipoT)
            {
                if (nombre._CodigoT.ToString() == codigo)
                {
                    lblEntP.Text = nombre._EntP._Nombre.ToString();
                    lblEntDire.Text = nombre._EntP._Direccion.ToString();
                }
            }

        }

        protected void BtnRegistrarSoli_Click(object sender, EventArgs e)
        {
            try
            {
                Empleado unE = (Empleado)Session["Empleado"];
                Empleado elE = LogicaEmpleado.BuscarEmpleado(unE._Ci);
                TipoDeTramite tipoT = LogicaTipoDeTramite.Buscar((GridView1.SelectedRow.Cells[1].Text.ToString().Trim()), lblEntP.Text.ToString());
                LogicaSolicitud.AgregarSoli(elE, tipoT, Calendar1.SelectedDate, TboxHora.Text.Trim(), TboxNombreSoli.Text.Trim());
                lblError.Text = "Se ah agregado la Solicitud con exito.";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}