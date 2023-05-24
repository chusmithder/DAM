fetch("https://jsonplaceholder.typicode.com/users")
    .then(function (response) { return response.json(); })
    .then(function (data) { return mostrarEnTabla(data); })["catch"](function (error) { return console.log(error); });
function mostrarEnTabla(data) {
    var body = "";
    for (var i = 0; i < data.length; i++) {
        body += "<tr><td>".concat(data[i].id, "</td><td>").concat(data[i].name, "</td><td>").concat(data[i].email, "</td></tr>");
    }
    document.getElementById("data").innerHTML += body;
}
