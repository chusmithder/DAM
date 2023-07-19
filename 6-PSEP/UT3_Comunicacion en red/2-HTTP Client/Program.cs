//mediante una instancia de httpclient se puede obtener el texto
//de respuesta a la solicitud que se hace a una url

/*
Mediante una instancia de la clase HttpClient se puede obtener el
texto de respuesta a la solicitud que se hace a una url. Este
método es asíncrono y por tanto si necesitamos su respuesta para 
continuar se deberá hacer un await y por consiguiente definir el 
método que lo contiene con la palabra clave async. En el caso del
método Main será una tarea asíncrona: static async Task Main
*/
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace httpclient
{
    class Program
    {
        // HttpClient is intended to be instantiated once per application, rather than per-use. See Remarks.
        static readonly HttpClient client = new HttpClient();
        static async Task Main()
        {
            // Call asynchronous network methods in a try/catch block to handle exceptions.
            try
            {
                //string url = "http://www.contoso.com/";
                string url = "https://turing.plymouth.edu/~zshen/Webfiles/notes/CS130/PythonExamples/jscript.html";
                //HttpResponseMessage response = await client.GetAsync(url);
                //response.EnsureSuccessStatusCode();
                //string responseBody = await response.Content.ReadAsStringAsync();
                //// Above three lines can be replaced with new helper method below
                string responseBody = await client.GetStringAsync(url);

                Console.WriteLine(responseBody);
            }
            catch (HttpRequestException e)
            {
                Console.WriteLine("\nException Caught!");
                Console.WriteLine("Message :{0} ", e.Message);
            }
        }

    }
}