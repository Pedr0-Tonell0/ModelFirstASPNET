using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class Genero
    {
        Datos.Genero objDatos = new Datos.Genero();
        public void Agregar(Entidades.Genero genero)
        {
            try
            {
                if(genero.Nombre.Contains("Violencia"))
                {
                    throw new Exception("Genero no permitido");
                }
                objDatos.Agregar(genero);
            }
            catch (Exception ex)
            {

                throw new Exception (ex.Message);
            }
        }
        public List<Entidades.Genero> TraerTodos()
        {
          return  objDatos.TraerTodos();
        }
        public Entidades.Genero TraerxId(int id)
        {
            return objDatos.TraerxId(id);
        }
        public void Modificar(Entidades.Genero genero)
        {
            objDatos.Modificar(genero);
        }
        public void Borrar(Entidades.Genero genero)
        {
            objDatos.Borrar(genero);
        }
    }
}
