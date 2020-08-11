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
    public partial class ABMTiposDeTramite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                this.LimpioFormulario();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                string ent = TboxEntP.Text.Trim();
                string codigo = TBoxCodigoT.Text.Trim();
                EntidadPublica _objeto = Logica.LogicaEntidadPublica.Buscar(ent);
                TipoDeTramite _tipoT = Logica.LogicaTipoDeTramite.Buscar(codigo, ent);

                if (_objeto == null)
                {
                    lblError.Text = "No existe esta Entidad Publica.";
                }
                else if (_tipoT == null)
                {
                    this.ActivoBotonesA();
                    Session["ABMTiposDeTramite"] = null;
                    RfvDescripcion.Enabled = true;
                    RfvNombreT.Enabled = true;
                    TBoxDescripcion.Enabled = true;
                    TBoxNombreT.Enabled = true;
                }
                else
                {
                    this.ActivoBotonesBM();
                    Session["ABMTiposDeTramite"] = _tipoT;
                    TBoxNombreT.Text = _tipoT._Nombre.ToString();
                    TBoxDescripcion.Text = _tipoT._Descripcion.ToString();
                    RfvNomEnt.Enabled = false;
                    RfvCodigoT.Enabled = true;
                    RevCodigoT.Enabled = true;
                    RfvNombreT.Enabled = true;
                    RfvDescripcion.Enabled = true;
                    TBoxDescripcion.Enabled = true;
                    TBoxNombreT.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void ActivoBotonesA()
        {
            btnModificar.Enabled = false;
            btnEliminar.Enabled = false;
            btnAgregar.Enabled = true;
            btnBuscar.Enabled = false;
            RfvNombreT.Enabled = true;
            RfvDescripcion.Enabled = true;
        }
        private void ActivoBotonesBM()
        {
            btnModificar.Enabled = true;
            btnEliminar.Enabled = true;
            btnAgregar.Enabled = false;
            btnBuscar.Enabled = false;
            TboxEntP.Enabled = false;
            TBoxCodigoT.Enabled = false;
            TBoxDescripcion.Enabled = true;
            TBoxNombreT.Enabled = true;
        }
        private void LimpioFormulario()
        {
            btnAgregar.Enabled = false;
            btnModificar.Enabled = false;
            btnEliminar.Enabled = false;
            btnBuscar.Enabled = true;
            TBoxDescripcion.Enabled = false;
            TboxEntP.Enabled = true;
            TBoxNombreT.Enabled = false;
            TBoxCodigoT.Enabled = true;
            RfvNombreT.Enabled = false;
            RfvNomEnt.Enabled = true;
            RfvCodigoT.Enabled = true;
            RfvDescripcion.Enabled = false;

            TboxEntP.Text = "";
            TBoxNombreT.Text = "";
            TBoxCodigoT.Text = "";
            TBoxDescripcion.Text = "";

            lblError.Text = "";
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                string ent = TboxEntP.Text.Trim();
                EntidadPublica _objeto = Logica.LogicaEntidadPublica.Buscar(ent);

                TipoDeTramite unTipo = new TipoDeTramite(_objeto, TBoxCodigoT.Text.Trim(), TBoxNombreT.Text.Trim(), TBoxDescripcion.Text.Trim());

                Logica.LogicaTipoDeTramite.Agregar(unTipo);

                this.LimpioFormulario();

                lblError.Text = "El tipo de tramite fue agregado con exito.";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                TipoDeTramite _Tipo = (TipoDeTramite)Session["ABMTiposDeTramite"];
                _Tipo._Nombre = TBoxNombreT.Text.Trim();
                _Tipo._Descripcion = TBoxDescripcion.Text.Trim();

                Logica.LogicaTipoDeTramite.Modificar(_Tipo);
                this.LimpioFormulario();
                lblError.Text = "Modificacion con éxito";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            TipoDeTramite unTipo = (TipoDeTramite)Session["ABMTiposDeTramite"];
            try
            {
                Logica.LogicaTipoDeTramite.Eliminar(unTipo);
                this.LimpioFormulario();
                lblError.Text = "Eliminacion con éxito";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnLimpio_Click(object sender, EventArgs e)
        {
            this.LimpioFormulario();
        }



    }
}