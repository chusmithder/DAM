/*
Prepara una página (diseño libre + Typescript) que muestre 
información de tu perfil público u otro que conozcas en github. 

Utiliza para ello la API REST ofrecida por github 
api.github.com/users/tuUsuario 
*/

let url = "https://api.github.com/users/cpindayddam1";
fetch(url)
    .then(response => response.json())
    .then(data => mostrarEnTabla(data))
    .catch(error => console.log(error));

function mostrarEnTabla(data) {
    console.log(data);
    let body = `<h2>${data.login}</h2>`;
    body += `<p>${data.id}</p>`;
    body += `<p>${data.url}</p>`;
    body += `<img src=”${data.avatar_url}”/>`;

    document.getElementById("resul")!.innerHTML += body;
    console.log(body);

}

