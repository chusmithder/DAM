/*
Prepara una página (diseño libre + Typescript) que muestre
información de tu perfil público u otro que conozcas en github.

Utiliza para ello la API REST ofrecida por github
api.github.com/users/tuUsuario
*/
var url = "https://api.github.com/users/cpindayddam1";
fetch(url)
    .then(function (response) { return response.json(); })
    .then(function (data) { return mostrarEnTabla(data); })["catch"](function (error) { return console.log(error); });
function mostrarEnTabla(data) {
    // let body = "";
    // for (let i = 0; i < data.length; i++) {
    //     body += `<tr><td>${data[i].id}</td><td>${data[i].name}</td><td>${data[i].email}</td></tr>`;
    // }
    // document.getElementById("data")!.innerHTML += body;
    console.log(data);
    //ES SOLO UN OBJETO, no un array
    // let body  = `<tr><td>${data.login}</td><td>${data.id}</td><td>${data.url}</td><tr>`;
    var body = "<h2>".concat(data.login, "</h2>");
    body += "<p>".concat(data.id, "</p>");
    body += "<p>".concat(data.url, "</p>");
    body += "<img src=\u201D".concat(data.avatar_url, "\u201D/>");
    document.getElementById("resul").innerHTML += body;
    console.log(body);
}
