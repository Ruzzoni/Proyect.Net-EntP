using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaTipoDeTramite
    {
        public static TipoDeTramite Buscar(string CodigoT, string NombreEnt)
        {
            return ParsistenciaTipoDeTramite.Buscar(CodigoT,  NombreEnt);
        }

        public static void Agregar (TipoDeTramite tipo)
        {
            ParsistenciaTipoDeTramite.Agregar(tipo);
        }

        public static void Modificar(TipoDeTramite tipo)
        {
            ParsistenciaTipoDeTramite.Modificar(tipo);
        }

        public static void Eliminar(TipoDeTramite tipo)
        {
            ParsistenciaTipoDeTramite.Eliminar(tipo);
        }

        public static List<TipoDeTramite> ListarTipoTramite(string ent)
        {
            return ParsistenciaTipoDeTramite.ListarTramiteAsc(ent);
        }

        public static List<TipoDeTramite> ListarTodo()
        {
            return ParsistenciaTipoDeTramite.ListarTodosTramites();
        }
    }
}
