using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Empleado
    {
        private int Ci;
        private string Password;
        private string NombreEmp;

        public int _Ci
        {
            get { return Ci; }
            set { Ci = value; }
        }

        public string _Password
        {
            get { return Password; }
            set { Password = value; }
        }

        public string _NombreEmp
        {
            get { return NombreEmp; }
            set { NombreEmp = value; }
        }

        public Empleado(int nCi, string nPassword, string nNombre)
        {
            _Ci = nCi;
            _Password = nPassword;
            _NombreEmp = nNombre;
        }
    }
}
