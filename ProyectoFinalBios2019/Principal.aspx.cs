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
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<EntidadPublica> ent = LogicaEntidadPublica.ListarTodasEntidades();
                GridView1.DataSource = ent;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<TipoDeTramite> tipoT = LogicaTipoDeTramite.ListarTipoTramite(GridView1.SelectedRow.Cells[1].Text.ToString().Trim());
            GridView2.DataSource = tipoT;
            GridView2.DataBind();

        }
    }
}