using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistencia;
using EntidadesCompartidas;

namespace Logica
{
    public class LogicaEmpleado
    {
        public static void Agregar(Empleado emp)
        {
            if (emp is Empleado)
                PersistenciaEmpleado.Agregar((Empleado)emp);
            else if (emp == null)
                throw new Exception("Error no hay usuario para agregar.");
        }

        public static void Modificar(Empleado emp)
        {
            if (emp is Empleado)
                PersistenciaEmpleado.Modificar((Empleado)emp);
            else if (emp == null)
                throw new Exception("Error no hay usuario para modificar.");
        }

        public static void Eliminar(Empleado emp)
        {
            if (emp is Empleado)
                PersistenciaEmpleado.Eliminar((Empleado)emp);
            else if (emp == null)
                throw new Exception("Error no hay usuario para eliminar");
        }

        public static EntidadesCompartidas.Empleado BuscarEmpleado(int Ci)
        {
            return PersistenciaEmpleado.Buscar(Ci);
        }

        public static Empleado LoginEmp(int Ci, string Password)
        {
            return PersistenciaEmpleado.LogueoEmpleado(Ci, Password);
        }
    }
}
