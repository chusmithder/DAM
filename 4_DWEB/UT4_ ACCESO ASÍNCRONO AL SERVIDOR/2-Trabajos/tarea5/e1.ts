/*
Recuperando el contenido de un archivo Json del servidor
Prepara una página que permita mostrar los datos de este archivo JSON (el archivo debes ubicarlo en tu “Live Server” de Visual Code)

*/

document.getElementById("btn")!.addEventListener("click", f);

function f() {
    
    let url = "archivo.json";
    fetch(url)
    .then(response => response.json())
    .then(data => mostrar(data))
    .catch(error => console.log(error));
}


function mostrar(data) {
    console.log(data);
    let datos = data;
    document.getElementById("th")!.innerHTML = `<tr>
    <td>ID</td>
    <td>NOMBRE</td>
    <td>PAIS</td>
    <td>EDAD</td>
    <td>OCUPACION</td>
    </tr>`;
    let body = "";
    for(let i = 0; i < data.length; i++) {
        body += `<tr><td>${data[i].id}</td><td>${data[i].nombre}</td><td>${data[i].pais}</td><td>${data[i].edad}</td><td>${data[i].ocupacion}</td></tr>`
    }
    document.getElementById("data")!.innerHTML = body;
}