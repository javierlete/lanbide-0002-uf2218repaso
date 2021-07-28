using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UF2218Repaso.Models
{
    public class Pelicula
    {
        public long Id { get; set; }
        public string Titulo { get; set; }
        public DateTime Fecha { get; set; }

        public Pelicula(long id, string titulo, DateTime fecha)
        {
            Id = id;
            Titulo = titulo;
            Fecha = fecha;
        }

        public Pelicula() { }

        public override string ToString()
        {
            return $"{Id}, {Titulo}, {Fecha}";
        }
    }
}