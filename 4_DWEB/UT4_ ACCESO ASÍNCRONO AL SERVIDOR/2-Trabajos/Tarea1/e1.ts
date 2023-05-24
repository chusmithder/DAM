fetch("https://jsonplaceholder.typicode.com/users")
    .then(response => response.json())
    .then(data => mostrarEnTabla(data))
    .catch(error => console.log(error));

function mostrarEnTabla(data) {
    let body = "";
    for (let i = 0; i < data.length; i++) {
        body += `<tr><td>${data[i].id}</td><td>${data[i].name}</td><td>${data[i].email}</td></tr>`;
    }
    document.getElementById("data")!.innerHTML += body;
}
