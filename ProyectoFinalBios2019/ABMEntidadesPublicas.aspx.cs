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
    public partial class ABMEntidadesPublicas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                this.LimpioFormulario();
        }

        private void ActivoBotonesA()
        {
            btnModificar.Enabled = false;
            btnEliminar.Enabled = false;
            btnAgregar.Enabled = true;
            btnBuscarEnt.Enabled = false;
            RfvNomEnt.Enabled = true;
            RfvTelefono.Enabled = true;
            RfvDireccion.Enabled = true;
            TboxEntidadP.Enabled = false;
            TboxTelefono.Enabled = true;
            TboxDireccion.Enabled = true;
        }
        private void ActivoBotonesBM()
        {
            btnModificar.Enabled = true;
            btnEliminar.Enabled = true;
            btnAgregar.Enabled = false;
            btnBuscarEnt.Enabled = false;
            TboxEntidadP.Enabled = false;
            TboxTelefono.Enabled = true;
            TboxDireccion.Enabled = true;
            LBoxTelefonos.Enabled = true;
            LBoxTelefonos.Visible = true;
        }
        private void LimpioFormulario()
        {
            btnAgregar.Enabled = false;
            btnModificar.Enabled = false;
            btnEliminar.Enabled = false;
            btnBuscarEnt.Enabled = true;
            TboxDireccion.Enabled = false;
            TboxEntidadP.Enabled = true;
            TboxTelefono.Enabled = false;
            LBoxTelefonos.Enabled = false;
            LBoxTelefonos.Visible = false;
            RfvNomEnt.Enabled = true;
            RfvTelefono.Enabled = false;
            RfvDireccion.Enabled = false;
            btnAgregarTel.Enabled = false;
            btnEliminarTel.Enabled = false;

            TboxDireccion.Text = "";
            TboxEntidadP.Text = "";
            TboxTelefono.Text = "";
            lblError.Text = "";
        }

        protected void btnBuscarEnt_Click(object sender, EventArgs e)
        {
            try
            {
                string ent = TboxEntidadP.Text.Trim();
                EntidadPublica _objeto = LogicaEntidadPublica.Buscar(ent);

                if (_objeto == null)
                {
                    this.ActivoBotonesA();
                    Session["ABMEntidadesPublicas"] = null;
                    RfvNomEnt.Enabled = true;
                    RfvDireccion.Enabled = true;
                    RfvTelefono.Enabled = false;
                    TboxTelefono.Enabled = false;
                    lblTel.Enabled = false;
                    btnAgregarTel.Enabled = false;
                    btnEliminarTel.Enabled = false;
                    lblError.Text = "Despues de crear la entidad deverá agregarle los telefonos correspondientes.";
                }
                else
                {
                    this.ActivoBotonesBM();
                    List<int> _telefonos = LogicaEntidadPublica.BuscarTelefonos(ent);
                    _objeto._Telefonos = _telefonos;
                    Session["ABMEntidadesPublicas"] = _objeto;
                    LBoxTelefonos.DataSource = _objeto._Telefonos;
                    LBoxTelefonos.DataBind();
                    TboxDireccion.Text = _objeto._Direccion.ToString();
                    TboxEntidadP.Text = _objeto._Nombre.ToString();
                    List<Solicitud> entidad = Logica.LogicaSolicitud.ListarSolis();
                    foreach (Solicitud enti in entidad)
                    {
                        if (enti._TipoT._EntP._Nombre == TboxEntidadP.Text.Trim().ToString())
                        {
                            btnEliminar.Enabled = false;
                        }

                    }
                    RfvDireccion.Enabled = true;
                    RfvNomEnt.Enabled = true;
                    RfvTelefono.Enabled = true;
                    RevTelefono.Enabled = true;
                    btnAgregarTel.Enabled = true;
                    btnEliminarTel.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAgregarTel_Click(object sender, EventArgs e)
        {
            try
            {
                string nombreEnt = TboxEntidadP.Text.Trim();
                int numero = Convert.ToInt32(TboxTelefono.Text.Trim());
                LogicaEntidadPublica.AgregarTelefono(nombreEnt, numero);

                List<int> _telefonos = LogicaEntidadPublica.BuscarTelefonos(nombreEnt);
                LBoxTelefonos.DataSource = _telefonos;
                LBoxTelefonos.DataBind();

                lblError.Text = "Se ah agregado un nuevo telefono para la Entidad Publica.";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnEliminarTel_Click(object sender, EventArgs e)
        {
            try
            {
                string nombreEnt = TboxEntidadP.Text.Trim();
                int numero = Convert.ToInt32(TboxTelefono.Text.Trim());
                LogicaEntidadPublica.EliminarTelefono(nombreEnt, numero);
                lblError.Text = "Eliminacion con éxito";

                List<int> _telefonos = LogicaEntidadPublica.BuscarTelefonos(nombreEnt);

                LBoxTelefonos.DataSource = _telefonos;
                LBoxTelefonos.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                EntidadPublica _Ent = new EntidadPublica(TboxEntidadP.Text.Trim(), null, TboxDireccion.Text.Trim());
                LogicaEntidadPublica.Alta(_Ent);
                this.LimpioFormulario();

                lblError.Text = "La Entidad Publica ah sido agregada con exito. Ahora agrege los telefonos.";
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
                EntidadPublica _Ent = (EntidadPublica)Session["ABMEntidadesPublicas"];
                _Ent._Nombre = TboxEntidadP.Text.Trim();
                _Ent._Direccion = TboxDireccion.Text.Trim();

                LogicaEntidadPublica.Modificar(_Ent);
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
            EntidadPublica unaE = (EntidadPublica)Session["ABMEntidadesPublicas"];
            try
            {
                    LogicaEntidadPublica.Eliminar(unaE);
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