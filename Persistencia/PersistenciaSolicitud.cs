using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaSolicitud 
    {
        public static void AgregarSoli(Empleado emp, TipoDeTramite tipoT, DateTime Fecha, string Hora, string NombreSolicitante)
        {
            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("RegistroSolicitud", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@CodigoDeT", tipoT._CodigoT.ToString());
            _Comando.Parameters.AddWithValue("@CiEmp", Convert.ToInt32(emp._Ci));
            _Comando.Parameters.AddWithValue("@NombreSolicitante", NombreSolicitante.ToString());
            _Comando.Parameters.AddWithValue("@Fecha", (DateTime)Fecha);
            _Comando.Parameters.AddWithValue("@Hora", Hora.ToString());
            _Comando.Parameters.AddWithValue("@NombreEnt", tipoT._EntP._Nombre.ToString());

            SqlParameter _Retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _Retorno.Direction = ParameterDirection.ReturnValue;
            _Comando.Parameters.Add(_Retorno);

            try
            {
                _Conexion.Open();
                _Comando.ExecuteNonQuery();

                int oAfectados = (int)_Comando.Parameters["@Retorno"].Value;

                if (oAfectados == -1)
                    throw new Exception("No existe la Entidad Publica con este nombre.");
                else if (oAfectados == -2)
                    throw new Exception("El codigo de tramite NO puede ser mayor a 6 letras y tampoco repetirse");
                else if (oAfectados == -3)
                    throw new Exception("ERROR.");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _Conexion.Close();
            }
        }

        public static void ModificarSoliEjec(int numerosoli)
        {
            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("SolicitudCambioEjec", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@NumeroSol", Convert.ToInt32(numerosoli.ToString()));

            SqlParameter _Retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _Retorno.Direction = ParameterDirection.ReturnValue;
            _Comando.Parameters.Add(_Retorno);

            try
            {
                _Conexion.Open();
                _Comando.ExecuteNonQuery();

                int oAfectados = (int)_Comando.Parameters["@Retorno"].Value;

                if (oAfectados == -2)
                    throw new Exception("Error.");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _Conexion.Close();
            }
        }//ponerla dentro de la gridview

        public static void ModificarSoliAnu(int numerosoli)
        {
            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("SolicitudCambioAnu", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@NumeroSol", Convert.ToInt32(numerosoli.ToString()));

            SqlParameter _Retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _Retorno.Direction = ParameterDirection.ReturnValue;
            _Comando.Parameters.Add(_Retorno);

            try
            {
                _Conexion.Open();
                _Comando.ExecuteNonQuery();

                int oAfectados = (int)_Comando.Parameters["@Retorno"].Value;

                if (oAfectados == -2)
                    throw new Exception("Error.");

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _Conexion.Close();
            }
        }//ponerla dentro de la gridview

        public static List<Solicitud> BuscarSoli(int NumeroSoli)
        {
            List<Solicitud> _lista = new List<Solicitud>();
            Solicitud Soli = null;
            SqlDataReader _Reader;
            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("BuscarSoli ", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@NumeroSoli", NumeroSoli.ToString());

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Soli = new Solicitud(PersistenciaEmpleado.Buscar(Convert.ToInt32(_Reader["CiEmp"].ToString())),
                            ParsistenciaTipoDeTramite.Buscar(_Reader["CodigoDeT"].ToString(),
                            _Reader["NombreEntP"].ToString()), Convert.ToInt32(_Reader["NumeroSoli"].ToString()),
                            (DateTime)_Reader["Fecha"], _Reader["Hora"].ToString(), _Reader["Estado"].ToString(), _Reader["NombreDelSolicitante"].ToString());
                        _lista.Add(Soli);
                    }
                }
                _Reader.Close();

                if (Soli == null)
                {
                    return _lista = null;
                }          
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return _lista;
        }

        public static List<Solicitud> ListarSolicitudTodas()
        {
            List<Solicitud> _lista = new List<Solicitud>();
            SqlDataReader _Reader;


            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("ListadoSolicitudesTodas", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Solicitud Soli = new Solicitud(PersistenciaEmpleado.Buscar(Convert.ToInt32(_Reader["CiEmp"].ToString())),
                            ParsistenciaTipoDeTramite.Buscar(_Reader["CodigoDeT"].ToString(),
                            _Reader["NombreEntP"].ToString()), Convert.ToInt32(_Reader["NumeroSoli"].ToString()),
                            (DateTime)_Reader["Fecha"], _Reader["Hora"].ToString(), _Reader["Estado"].ToString(), _Reader["NombreDelSolicitante"].ToString());
                        _lista.Add(Soli);
                    }
                }

                _Reader.Close();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return _lista;
        }//lista con todsas las solis y ordenadas por fecha y hora

        public static List<Solicitud> ListarSolicitudDeXTramite(string codigo, string ent)
        {
            List<Solicitud> _lista = new List<Solicitud>();
            SqlDataReader _Reader;


            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("ListadoSolicitudesDeXTramiteTodas", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@codigo", codigo.ToString());
            _Comando.Parameters.AddWithValue("@entidadP", ent.ToString());

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Solicitud Soli = new Solicitud(PersistenciaEmpleado.Buscar(Convert.ToInt32(_Reader["CiEmp"].ToString())),
                            ParsistenciaTipoDeTramite.Buscar(_Reader["CodigoDeT"].ToString(),
                            _Reader["NombreEntP"].ToString()), Convert.ToInt32(_Reader["NumeroSoli"].ToString()),
                            (DateTime)_Reader["Fecha"], _Reader["Hora"].ToString(), _Reader["Estado"].ToString(), _Reader["NombreDelSolicitante"].ToString());
                        _lista.Add(Soli);
                    }
                }

                _Reader.Close();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return _lista;
        }

        public static List<Solicitud> ListarSolicitudesAlta()
        {
            List<Solicitud> _lista = new List<Solicitud>(); ;
            SqlDataReader _Reader;


            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("ListadoSolicitudesAlta", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Solicitud Soli = new Solicitud(PersistenciaEmpleado.Buscar(Convert.ToInt32(_Reader["CiEmp"].ToString())),
                            ParsistenciaTipoDeTramite.Buscar(_Reader["CodigoDeT"].ToString(),
                            _Reader["NombreEntP"].ToString()), Convert.ToInt32(_Reader["NumeroSoli"].ToString()),
                            (DateTime)_Reader["Fecha"], _Reader["Hora"].ToString(), _Reader["Estado"].ToString(), _Reader["NombreDelSolicitante"].ToString());
                        _lista.Add(Soli);
                    }
                }

                _Reader.Close();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return _lista;
        }

        public static List<Solicitud> ListarSolicitudEjecutadas(string codigo, string ent)
        {
            List<Solicitud> _lista = new List<Solicitud>(); ;
            SqlDataReader _Reader;


            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("ListadoSolicitudesEjecutadas", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@codigo", codigo.ToString());
            _Comando.Parameters.AddWithValue("@entidadP", ent.ToString());

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Solicitud Soli = new Solicitud(PersistenciaEmpleado.Buscar(Convert.ToInt32(_Reader["CiEmp"].ToString())),
                            ParsistenciaTipoDeTramite.Buscar(_Reader["CodigoDeT"].ToString(),
                            _Reader["NombreEntP"].ToString()), Convert.ToInt32(_Reader["NumeroSoli"].ToString()),
                            (DateTime)_Reader["Fecha"], _Reader["Hora"].ToString(), _Reader["Estado"].ToString(), _Reader["NombreDelSolicitante"].ToString());
                        _lista.Add(Soli);
                    }
                }

                _Reader.Close();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return _lista;
        }

        public static List<Solicitud> ListarSolicitudAnuladas(string codigo, string ent)
        {
            List<Solicitud> _lista = new List<Solicitud>(); ;
            SqlDataReader _Reader;


            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("ListadoSolicitudesAnuladas", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@codigo", codigo.ToString());
            _Comando.Parameters.AddWithValue("@entidadP", ent.ToString());

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Solicitud Soli = new Solicitud(PersistenciaEmpleado.Buscar(Convert.ToInt32(_Reader["CiEmp"].ToString())),
                            ParsistenciaTipoDeTramite.Buscar(_Reader["CodigoDeT"].ToString(),
                            _Reader["NombreEntP"].ToString()), Convert.ToInt32(_Reader["NumeroSoli"].ToString()),
                            (DateTime)_Reader["Fecha"], _Reader["Hora"].ToString(), _Reader["Estado"].ToString(), _Reader["NombreDelSolicitante"].ToString());
                        _lista.Add(Soli);
                    }
                }

                _Reader.Close();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return _lista;
        }

        public static List<Solicitud> ListarSolicitudXFecha(DateTime fecha)
        {
            List<Solicitud> _lista = new List<Solicitud>(); ;
            SqlDataReader _Reader;


            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("ListadoSolicitudesXFecha", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@fecha", fecha);

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        Solicitud Soli = new Solicitud(PersistenciaEmpleado.Buscar(Convert.ToInt32(_Reader["CiEmp"].ToString())),
                            ParsistenciaTipoDeTramite.Buscar(_Reader["CodigoDeT"].ToString(),
                            _Reader["NombreEntP"].ToString()), Convert.ToInt32(_Reader["NumeroSoli"].ToString()),
                            (DateTime)_Reader["Fecha"], _Reader["Hora"].ToString(), _Reader["Estado"].ToString(), _Reader["NombreDelSolicitante"].ToString());
                        _lista.Add(Soli);
                    }
                }

                _Reader.Close();

            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problemas con la base de datos:" + ex.Message);
            }
            finally
            {
                _Conexion.Close();
            }

            return _lista;
        }

    }
}
