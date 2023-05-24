/*
Prepara una página (diseño libre + Typescript) que muestre
información de tu perfil público u otro que conozcas en github.

Utiliza para ello la API REST ofrecida por github
api.github.com/users/tuUsuario
*/
document.getElementById("btn").addEventListener("click", f);
function f() {
    var url = "https://randomuser.me/api/";
    fetch(url)
        .then(function (response) { return response.json(); })
        .then(function (data) { return mostrar(data); })["catch"](function (error) { return console.log(error); });
}
function mostrar(data) {
    console.log(data);
    var datos = data.results[0];
    var body = "<h2>".concat(datos.name.first, " ").concat(datos.name.last, "</h2>");
    body += "<img src=\"".concat(datos.picture.large, "\"/>");
    document.getElementById("resul").innerHTML = body;
    console.log(body);
}
