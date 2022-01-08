using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Genero
    {
        Entidades.BiblioContext db = new Entidades.BiblioContext();

        public void Agregar(Entidades.Genero genero)
        {
            db.Generos.Add(genero);
            db.SaveChanges();
        }

        public List<Entidades.Genero> TraerTodos()
        {
            var lista = from g in db.Generos
                        select g;
            return lista.ToList();         
        }
        public Entidades.Genero TraerxId(int id)
        {
            var genero = db.Generos.Find(id);
            return genero;
        }
        public void Modificar (Entidades.Genero genero)
        {
            var generoModificar = db.Generos.Find(genero.Id);
            generoModificar.Id = genero.Id;
            generoModificar.Nombre = genero.Nombre;
            db.SaveChanges();
        }
        public void Borrar (Entidades.Genero genero)
        {
            db.Generos.Remove(genero);
            db.SaveChanges();
        }

    }
}
