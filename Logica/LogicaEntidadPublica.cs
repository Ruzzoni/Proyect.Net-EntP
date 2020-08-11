using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaEntidadPublica
    {
        public static void Alta(EntidadPublica ent)
        {
            PersistenciaEntidadPublica.Agregar(ent);
        }

        public static void Modificar(EntidadPublica ent)
        {
            PersistenciaEntidadPublica.Modificar(ent);
        }

        public static void Eliminar(EntidadPublica ent)
        {
            PersistenciaEntidadPublica.Eliminar(ent);
        }

        public static EntidadPublica Buscar(string Nombre)
        {
           return PersistenciaEntidadPublica.Buscar(Nombre);
        }

        public static List<int> BuscarTelefonos(String nombre)
        {
            return PersistenciaEntidadPublica.BuscarTelefonos(nombre);
        }

        public static void AgregarTelefono(string nombre, int numero)
        {
            PersistenciaEntidadPublica.AgregarTelefonos(nombre, numero);
        }

        public static void EliminarTelefono(string nombre, int numero)
        {
            PersistenciaEntidadPublica.EliminarTelefono(nombre, numero);
        }

        public static List<EntidadPublica> ListarTodasEntidades()
        {
            return PersistenciaEntidadPublica.ListaEntidadesPublicas();
        }

    }
}
