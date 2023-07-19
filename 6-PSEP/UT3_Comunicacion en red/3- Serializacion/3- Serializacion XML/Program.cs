/*
Ejemplo de serialización xml en un fichero.
https://stackoverflow.com/questions/3862063/serializing-an-object-as-utf-8-xml-in-net
*/
using System;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace xmlserializer
{
    public class Message
    {
        public string Txt { get; set; }
        public string Hash { get; set; }
        public DateTime Stamp { get; set; }
        public Message() { }
        public Message(string txt, string hash)
        {
            this.Txt = txt;
            this.Hash = hash;
            Stamp = DateTime.Now;
        }
    }

    public static class Program
    {
        static void Main()
        {
            string fileName = "message.xml";
            Message m1 = new Message("Hola mundo!", "DAAEF2");
            string s1 = Program.Serialize<Message>(m1, fileName);
            Message m2 = Program.Deserialize<Message>(fileName);
            Console.WriteLine(m2.Txt);
            Console.WriteLine("Done");
            Console.ReadLine();
        }

        public static string Serialize<T>(T value, string path)
        {
            if (value == null)
            {
                return string.Empty;
            }
            try
            {
                string s1;
                var xmlserializer = new XmlSerializer(typeof(T));
                using (StringWriter writer = new Utf8StringWriter())
                {
                    xmlserializer.Serialize(writer, value);
                    s1 = writer.ToString();
                    File.WriteAllText(path, s1, Encoding.UTF8);//adds a BOM (Byte Order Mark) to the file
                }
                return s1;
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred", ex);
            }
        }

        public class Utf8StringWriter : StringWriter
        {
            public override Encoding Encoding => Encoding.UTF8;
        }
        public static T Deserialize<T>(string path)
        {
            XmlSerializer ser = new XmlSerializer(typeof(T));
            T type;
            using (XmlReader reader = XmlReader.Create(path))
            {
                type = (T)ser.Deserialize(reader);
            }
            return type;
        }
    }
}