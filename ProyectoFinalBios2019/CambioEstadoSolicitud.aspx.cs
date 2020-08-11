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
    public partial class CambioEstadoSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack))
            {
                List<Solicitud> Solis = LogicaSolicitud.ListarSolisAlta();
                GridView1.DataSource = Solis;
                GridView1.DataBind();
            }
        }

        //protected void BtnEjecutada_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        int numerosoli = Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text.Trim());
        //        List<Solicitud> SoliCambiada = LogicaSolicitud.Buscar(numerosoli);
        //        LogicaSolicitud.CambioEstadoEjec(numerosoli);
        //        List<Solicitud> Solis = LogicaSolicitud.ListarSolisAlta();
        //        GridView1.DataSource = Solis;
        //        GridView1.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        lblError.Text = ex.Message;
        //    }
        //}

        //protected void BtnAnulada_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        int numerosoli = Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text.Trim());
        //        List<Solicitud> SoliCambiada = LogicaSolicitud.Buscar(numerosoli);
        //        LogicaSolicitud.CambioEstadoAnu(numerosoli);
        //        GridView1.DataSource = SoliCambiada;
        //        GridView1.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        lblError.Text = ex.Message;
        //    }
        //}
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow nombre = GridView1.SelectedRow;
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        { 
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[rowIndex];

            if (e.CommandName == "BtnEjecutar")
            {
                int numerosoli = Convert.ToInt32(row.Cells[2].Text.Trim());
                List<Solicitud> SoliCambiada = LogicaSolicitud.Buscar(numerosoli);
                LogicaSolicitud.CambioEstadoEjec(numerosoli);
                List<Solicitud> Solis = LogicaSolicitud.ListarSolisAlta();
                GridView1.DataSource = Solis;
                GridView1.DataBind();                             
            }
            else if (e.CommandName == "BtnAnulada")
            {
                 int numerosoli = Convert.ToInt32(row.Cells[2].Text.Trim());
                List<Solicitud> SoliCambiada = LogicaSolicitud.Buscar(numerosoli);
                LogicaSolicitud.CambioEstadoAnu(numerosoli);
                List<Solicitud> Solis = LogicaSolicitud.ListarSolisAlta();
                GridView1.DataSource = Solis;
                GridView1.DataBind();   
                
            }
        }
    }
}