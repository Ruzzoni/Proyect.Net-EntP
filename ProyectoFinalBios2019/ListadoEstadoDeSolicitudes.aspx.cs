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
    public partial class ListadoEstadoDeSolicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DdlEntP.DataSource = LogicaEntidadPublica.ListarTodasEntidades();
                DdlEntP.DataTextField = "_Nombre";
                DdlEntP.DataValueField = "_Nombre";
                DdlEntP.DataBind();
                DdlEntP.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
                DdlFiltro.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
                DdlFiltro.Enabled = false;
                DdlFiltro.Visible = false;
                lblFiltroEstado.Visible = false;
            }
        }

        protected void DdlEntP_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<TipoDeTramite> tipoT = LogicaTipoDeTramite.ListarTipoTramite(DdlEntP.SelectedValue.ToString().Trim());
            GridView1.DataSource = tipoT;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TipoDeTramite Select = LogicaTipoDeTramite.Buscar(GridView1.SelectedRow.Cells[1].Text.Trim(), DdlEntP.SelectedValue.ToString().Trim());
            List<Solicitud> soliSelected = LogicaSolicitud.ListarSoliXtipotramite(Select._CodigoT.ToString(), Select._EntP._Nombre.ToString());
            GridView2.DataSource = soliSelected;
            GridView2.DataBind();
            DdlFiltro.Enabled = true;
            DdlFiltro.Visible = true;
            lblFiltroEstado.Visible = true;
        }

        protected void DdlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            TipoDeTramite Select = LogicaTipoDeTramite.Buscar(GridView1.SelectedRow.Cells[1].Text.Trim(), DdlEntP.SelectedValue.ToString().Trim());
            if (DdlFiltro.SelectedValue == "Todos")
            {
                List<Solicitud> soliSelected = LogicaSolicitud.ListarSoliXtipotramite(Select._CodigoT.ToString(), Select._EntP._Nombre.ToString());
                GridView2.DataSource = soliSelected;
                GridView2.DataBind();
            }
            else if (DdlFiltro.SelectedValue == "Ejecutada")
            {
                List<Solicitud> soliSelected = LogicaSolicitud.ListarSoliEjec(Select._CodigoT.ToString(), Select._EntP._Nombre.ToString());
                GridView2.DataSource = soliSelected;
                GridView2.DataBind();
            }
            else if (DdlFiltro.SelectedValue == "Anulada")
            {
                List<Solicitud> soliSelected = LogicaSolicitud.ListarSoliAnu(Select._CodigoT.ToString(), Select._EntP._Nombre.ToString());
                GridView2.DataSource = soliSelected;
                GridView2.DataBind();
            }
        }
    }
}