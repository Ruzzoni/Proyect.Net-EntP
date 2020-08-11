using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaSolicitud
    {
        public static void AgregarSoli(Empleado emp, TipoDeTramite tipoT, DateTime Fecha, string Hora, string NombreSolicitante)
        { 
            PersistenciaSolicitud.AgregarSoli(emp, tipoT, Fecha, Hora, NombreSolicitante);
        }

        public static void CambioEstadoEjec(int numerosoli)
        {
            PersistenciaSolicitud.ModificarSoliEjec(numerosoli);
        }

        public static void CambioEstadoAnu(int numerosoli)
        {
            PersistenciaSolicitud.ModificarSoliAnu(numerosoli);
        }

        public static List<Solicitud> Buscar(int NumeroSoli)
        {
            return PersistenciaSolicitud.BuscarSoli(NumeroSoli);
        }

        public static List<Solicitud> ListarSoliXtipotramite(string codigo, string ent)
        {
            return PersistenciaSolicitud.ListarSolicitudDeXTramite(codigo, ent);
        }

        public static List<Solicitud> ListarSoliEjec(string codigo, string ent)
        {
            return PersistenciaSolicitud.ListarSolicitudEjecutadas(codigo, ent);
        }

        public static List<Solicitud> ListarSoliAnu(string codigo, string ent)
        {
            return PersistenciaSolicitud.ListarSolicitudAnuladas(codigo, ent);
        }

        public static List<Solicitud> ListarSolis()
        {
            return PersistenciaSolicitud.ListarSolicitudTodas();
        }

        public static List<Solicitud> ListarSolisAlta()
        {
            return PersistenciaSolicitud.ListarSolicitudesAlta();
        }

        public static List<Solicitud> ListarSoliXFecha(DateTime fecha)
        {
            return PersistenciaSolicitud.ListarSolicitudXFecha(fecha);
        }
    }
}
