using System;
using System.Collections.Generic;
using RestSharp; //dotnet add package RestSharp

namespace TodoApiConsumer
{
    class s
    {
        private const string BASEURL = "https://localhost:44317/api";

        static void Main(string[] args)
        {
            TodoItem item1 = GetItems(1);
            Console.WriteLine(item1.Name);

            List<TodoItem> list = GetItems();
            string str = "";
            foreach(TodoItem item in list) {
                // if (item.Name == "walk dog") {
                //     break;
                // }
                str += item.ToString();
            }
            Console.WriteLine(str);

            // TodoItem item2 = new TodoItem { Name = "Guardar ropa", IsComplete = true };
            // Console.WriteLine(item2);
            // item2 = PostItem(item2);
            // Console.WriteLine(item2);

            // TodoItem item3 = GetItems(4);
            // bool b = item3.IsComplete;
            // item3.IsComplete = !b;
            // PutItem(4, item3);
            // item3 = GetItems(4);
            // if (item3.IsComplete != b)
            // {
            //     Console.WriteLine("OK");
            // }
            // else
            // {
            //     Console.WriteLine("NOK");
            // }

            // DeleteItem(5);
        }

        private static TodoItem GetItems(int id)
        {
            var client = new RestClient(BASEURL);
            var request = new RestRequest($"/TodoItems/{id}", Method.Get);
            var response = client.Execute(request);
            //Console.WriteLine(response.Content);
            //Console.WriteLine(response.StatusCode);//NotFound|OK
            return TodoItem.FromJson(response.Content);
        }

        private static List<TodoItem> GetItems()
        {
            var client = new RestClient(BASEURL);
            var request = new RestRequest("TodoItems", Method.Get);
            var response = client.Execute(request);
            //Console.WriteLine(response.Content);
            return TodoItem.ListFromJson(response.Content);
        }

        private static TodoItem PostItem(TodoItem item)
        {
            var client = new RestClient(BASEURL);
            var request = new RestRequest("TodoItems", Method.Post);
            //request.AddParameter("data", data);
            request.AddJsonBody(item.ToJson());
            var response = client.Execute(request);
            //Console.WriteLine(response.Content);
            //Console.WriteLine(response.StatusCode);//NotFound|Created
            return TodoItem.FromJson(response.Content);
        }

        private static void PutItem(int id, TodoItem item)
        {
            var client = new RestClient(BASEURL);
            // var request = new RestRequest("TodoItems", Method.PUT);
            // request.AddParameter("id", id);
            // request.AddParameter("data", data);
            var request = new RestRequest($"/TodoItems/{id}", Method.Put);
            request.AddJsonBody(item.ToJson());
            var response = client.Execute(request);
            //Console.WriteLine(response.StatusCode);//NoContent|BadRequest
        }

        private static void DeleteItem(int id)
        {
            var client = new RestClient(BASEURL);
            var request = new RestRequest($"TodoItems/{id}", Method.Delete);
            var response = client.Execute(request);
            //Console.WriteLine(response.StatusCode);//NotFound|NoContent
        }
    }
}
