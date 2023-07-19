
long unixDate = 1297380023295;
DateTime start = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
DateTime date= start.AddMilliseconds(unixDate).ToLocalTime();

Console.WriteLine(date.Hour + ":" +  date.Minute);