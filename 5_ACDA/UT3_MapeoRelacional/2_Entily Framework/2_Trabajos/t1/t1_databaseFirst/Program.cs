using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace t1_databaseFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            using (NorthwindEntities db = new NorthwindEntities())
            {
                //*************************************************************************
                //*NOTA: Debes ir descomentando y ejecutando para ir viendo los resultados*
                //*************************************************************************

                //Agregar producto nuevo ---------------------------------------------
                Products p1 = new Products();
                p1.ProductID = 78;
                p1.ProductName = "Disco Mesmerize";

                db.Products.Add(p1);
                db.SaveChanges();

                var products = db.Products;
                foreach (var p in products)
                {
                    Console.WriteLine(p.CategoryID + " - " + p.ProductName);
                }

                ////Editar producto ---------------------------------------------
                //Products p2 = db.Products.Where(p => p.ProductName == "Disco Mesmerize").First();
                //p2.ProductName = "Disco Dire Straits";

                //db.Entry(p2).State = System.Data.Entity.EntityState.Modified;
                //db.SaveChanges();

                //var products2 = db.Products;
                //foreach (var p in products2)
                //{
                //    Console.WriteLine(p.CategoryID + " - " + p.ProductName);
                //}

                //Console.ReadLine();

                //Eliminar producto ---------------------------------------------
                //Products p3 = db.Products.Find(82);
                //db.Products.Remove(p3);
                //db.SaveChanges();

                //var products3 = db.Products;
                //foreach (var p in products3)
                //{
                //    Console.WriteLine(p.CategoryID + " - " + p.ProductName);
                //}

                //Console.ReadLine();
            }

        }
    }
}
