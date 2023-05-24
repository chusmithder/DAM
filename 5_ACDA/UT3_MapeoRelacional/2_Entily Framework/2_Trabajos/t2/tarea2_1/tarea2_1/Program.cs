using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace tarea2_1
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var db = new Model1())
            {
                // Insertar una nueva categoría
                Console.Write("Introduce un nombre para una nueva categoría: ");
                var name = Console.ReadLine();
                var cat = new Categories { CategoryName = name };
                db.Categories.Add(cat);
                db.SaveChanges();

                // Muestra todas las categorías de la BD
                var query = from b in db.Categories
                            orderby b.CategoryName
                            select b;

                Console.WriteLine("Todas las categorías de la database:");
                foreach (var item in query)
                {
                    Console.WriteLine(item.CategoryName);
                }

                Console.WriteLine("Press any key to exit...");
                Console.ReadKey();
            }
        }

    }
}
