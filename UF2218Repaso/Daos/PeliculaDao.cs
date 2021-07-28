using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UF2218Repaso.Models;

namespace UF2218Repaso.Daos
{
    public static class PeliculaDao
    {
        private readonly static Dictionary<long, Pelicula> peliculas = new Dictionary<long, Pelicula>()
        {
            { 1L, new Pelicula(1L, "Indiana Jones", DateTime.Now) },
            { 2L, new Pelicula(2L, "Superman", DateTime.Now) },
        };
        public static IEnumerable<Pelicula> ObtenerTodas()
        {
            return peliculas.Values;
        }

        public static Pelicula ObtenerPorId(long id)
        {
            return peliculas[id];
        }

        public static void Insertar(Pelicula pelicula)
        {
            long id = peliculas.Count > 0 ? peliculas.Keys.Last() + 1L : 1L;
            pelicula.Id = id;
            peliculas[id] = pelicula;
        }

        public static void Modificar(Pelicula pelicula)
        {
            peliculas[pelicula.Id] = pelicula;
        }

        public static void Borrar(Pelicula pelicula)
        {
            Borrar(pelicula.Id);
        }

        public static void Borrar(long id)
        {
            peliculas.Remove(id);
        }
    }
}