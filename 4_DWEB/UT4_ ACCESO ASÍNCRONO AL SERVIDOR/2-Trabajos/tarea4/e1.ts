/*
Prepara una página (diseño libre + Typescript) que muestre 
información de tu perfil público u otro que conozcas en github. 

Utiliza para ello la API REST ofrecida por github 
api.github.com/users/tuUsuario 
*/

document.getElementById("btn")!.addEventListener("click", f);

function f() {
    
    let url = "https://rickandmortyapi.com/api/character";
    fetch(url)
    .then(response => response.json())
    .then(data => mostrar(data))
    .catch(error => console.log(error));
}


function mostrar(data) {
    console.log(data);
    let num = <HTMLInputElement>document.getElementById("num");
    let datos = data.results[parseInt(num.value)];
    if (!(num.value == "")){
        let body = `<h2>${datos.name}</h2>`;
    
        body += `<img src="${datos.image}"/>`;

        document.getElementById("resul")!.innerHTML = body;
        console.log(body);
    } else {
        alert("Introduce un número")
    }
    
}