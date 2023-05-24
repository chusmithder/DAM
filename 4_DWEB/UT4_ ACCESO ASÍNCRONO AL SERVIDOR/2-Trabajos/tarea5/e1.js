/*
Recuperando el contenido de un archivo Json del servidor
Prepara una página que permita mostrar los datos de este archivo JSON (el archivo debes ubicarlo en tu “Live Server” de Visual Code)

*/
document.getElementById("btn").addEventListener("click", f);
function f() {
    var url = "archivo.json";
    fetch(url)
        .then(function (response) { return response.json(); })
        .then(function (data) { return mostrar(data); })["catch"](function (error) { return console.log(error); });
}
function mostrar(data) {
    console.log(data);
    var datos = data;
    document.getElementById("th").innerHTML = "<tr>\n    <td>ID</td>\n    <td>NOMBRE</td>\n    <td>PAIS</td>\n    <td>EDAD</td>\n    <td>OCUPACION</td>\n    </tr>";
    var body = "";
    for (var i = 0; i < data.length; i++) {
        body += "<tr><td>".concat(data[i].id, "</td><td>").concat(data[i].nombre, "</td><td>").concat(data[i].pais, "</td><td>").concat(data[i].edad, "</td><td>").concat(data[i].ocupacion, "</td></tr>");
    }
    document.getElementById("data").innerHTML = body;
}
