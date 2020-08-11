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
    public class ParsistenciaTipoDeTramite
    {
        public static TipoDeTramite Buscar(string CodigoT, string NombreEnt)
        {
            TipoDeTramite tipoT = null;
            SqlDataReader _Reader;
            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("BuscoTipoDeTramite " + CodigoT + ", " + NombreEnt, _Conexion);

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.Read())
                    tipoT = new TipoDeTramite(PersistenciaEntidadPublica.Buscar(_Reader["NombreEnt"].ToString()),_Reader["CodigoT"].ToString(), _Reader["NombreT"].ToString(), _Reader["Descripcion"].ToString());

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
            return tipoT;
        }

        public static void Agregar(TipoDeTramite tipoT)
        {
            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("AltaTipoTramite", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@CodigoT", tipoT._CodigoT.ToString());
            _Comando.Parameters.AddWithValue("@NombreT", tipoT._Nombre.ToString());
            _Comando.Parameters.AddWithValue("@Descripcion", tipoT._Descripcion.ToString());
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
                    throw new Exception("Error: No existe la Entidad Publica no se puede hacer un nuevo Tramite.");
                else if (oAfectados == -2)
                    throw new Exception("Error: Ya existe este tramite");
                else if (oAfectados == -3)
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
        }

        public static void Modificar(TipoDeTramite tipoT)
        {
            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("MoificarTipoTramite", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@CodigoT", tipoT._CodigoT.ToString());
            _Comando.Parameters.AddWithValue("@EntidadPublicaT", tipoT._EntP._Nombre.ToString());
            _Comando.Parameters.AddWithValue("@NombreT", tipoT._Nombre.ToString());
            _Comando.Parameters.AddWithValue("@Descripcion", tipoT._Descripcion.ToString());

            SqlParameter _Retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _Retorno.Direction = ParameterDirection.ReturnValue;
            _Comando.Parameters.Add(_Retorno);

            try
            {
                _Conexion.Open();
                _Comando.ExecuteNonQuery();

                int oAfectados = (int)_Comando.Parameters["@Retorno"].Value;

                if (oAfectados == -1)
                    throw new Exception("No se puede modificar un traminte de una Entidad Publica inexistente.");
                else if (oAfectados == -2)
                    throw new Exception("No se puede modificar un Tipo de Tramite inexistente");
                else if (oAfectados == -3)
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
        }

        public static void Eliminar(TipoDeTramite tipoT)
        {

            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("EliminoTipoTramite", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            _Comando.Parameters.AddWithValue("@CodigoT", tipoT._CodigoT.ToString());

            SqlParameter _Retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _Retorno.Direction = ParameterDirection.ReturnValue;

            _Comando.Parameters.Add(_Retorno);

            try
            {
                _Conexion.Open();
                _Comando.ExecuteNonQuery();

                int oAfectados = (int)_Comando.Parameters["@Retorno"].Value;

                if (oAfectados == -1)
                    throw new Exception("Error: No existe el traminte");
                else if (oAfectados == -2)
                    throw new Exception("Error: Si no existe el tipo de tramite asosiado a la Entidad Publica no se puede elimiar");
                else if (oAfectados == -3)
                    throw new Exception("Error");

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

        //ordenado por nombre de tramite asc
        public static List<TipoDeTramite> ListarTramiteAsc(string nombre)
        {
            List<TipoDeTramite> _lista = new List<TipoDeTramite>(); ;
            SqlDataReader _Reader;


            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("ListarTipoDeTramites ", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;
            _Comando.Parameters.AddWithValue("@nombreent", nombre.ToString());

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        TipoDeTramite T = new TipoDeTramite(PersistenciaEntidadPublica.Buscar(_Reader["EntidadPublicaT"].ToString()), _Reader["CodigoT"].ToString(), _Reader["NombreT"].ToString(), _Reader["Descripcion"].ToString());
                        _lista.Add(T);
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

        public static List<TipoDeTramite> ListarTodosTramites()
        {
            List<TipoDeTramite> _lista = new List<TipoDeTramite>(); ;
            SqlDataReader _Reader;


            SqlConnection _Conexion = new SqlConnection(Conexion._Cnn);
            SqlCommand _Comando = new SqlCommand("ListarTodosTipoDeTramites ", _Conexion);
            _Comando.CommandType = CommandType.StoredProcedure;

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                if (_Reader.HasRows)
                {
                    while (_Reader.Read())
                    {
                        TipoDeTramite T = new TipoDeTramite(PersistenciaEntidadPublica.Buscar(_Reader["EntidadPublicaT"].ToString()), _Reader["CodigoT"].ToString(), _Reader["NombreT"].ToString(), _Reader["Descripcion"].ToString());
                        _lista.Add(T);
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
