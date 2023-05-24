/*

*/

document.getElementById("btn")!.addEventListener("click", f);

function f() {
    let url = "https://randomuser.me/api/";
    fetch(url)
    .then(response => response.json())
    .then(data => mostrar(data))
    .catch(error => console.log(error));
}


function mostrar(data) {
    console.log(data);
    
    let datos = data.results[0];
    
    let body = `<h2>${datos.name.first} ${datos.name.last}</h2>`;
    
    body += `<img src="${datos.picture.large}"/>`;

    document.getElementById("resul")!.innerHTML = body;
    console.log(body);

}