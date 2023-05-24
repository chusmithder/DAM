/*
Prepara una página (diseño libre + Typescript) que muestre
información de tu perfil público u otro que conozcas en github.

Utiliza para ello la API REST ofrecida por github
api.github.com/users/tuUsuario
*/
document.getElementById("btn").addEventListener("click", f);
function f() {
    var url = "https://rickandmortyapi.com/api/character";
    fetch(url)
        .then(function (response) { return response.json(); })
        .then(function (data) { return mostrar(data); })["catch"](function (error) { return console.log(error); });
}
function mostrar(data) {
    console.log(data);
    var num = document.getElementById("num");
    var datos = data.results[parseInt(num.value)];
    if (!(num.value == "")) {
        var body = "<h2>".concat(datos.name, "</h2>");
        body += "<img src=\"".concat(datos.image, "\"/>");
        document.getElementById("resul").innerHTML = body;
        console.log(body);
    }
    else {
        alert("Introduce un número");
    }
}
