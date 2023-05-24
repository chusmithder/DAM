// https://themealdb.com/api.php
//todas las categorias
let listCategories = "https://www.themealdb.com/api/json/v1/1/categories.php";//obtendremos nombre de categoria

//metodo inicial que a partir de la api llama a la funcion mostrarCategorias
const mostrarDatos = async () => {
    try {
        const response = await fetch(listCategories);
        if (!response.ok) { throw Error()}
        const json = await response.json();
        mostrarCategorias(json);
    }
    catch (error) {
        console.log(error);
    }
}
mostrarDatos();

//muestra todas las categorias
function mostrarCategorias(json) {
    console.log(json);

    let body = "";
    let ac = json.categories;//array de categorias
    
    for(let i = 0; i < ac.length; i++) {
        body += `<div id="${ac[i].strCategory}" 
                    style="width: 150px; height=100px; cursor: pointer; text-align: center; border: 3px solid #73AD21; border-radius: 12px; margin: 4px 2px;" >
                    <h3>${ac[i].strCategory}</h3>
                    <img src="${ac[i].strCategoryThumb}" style="width: 150px;"/>
                </div>`;
    }
    document.getElementById("principal").innerHTML = body;
    

    for(let i = 0; i < ac.length; i++) {
        const e = document.getElementById(`${ac[i].strCategory}`);
        //eventos
        e.addEventListener("click", function() {fetchComidas(ac[i].strCategory);});
    }
     
    console.log(body);
}

//a traves de la url, muestra todos los platillos a partir de la categoria
const fetchComidas = async (categoria) => {
    let urlCat = `https://www.themealdb.com/api/json/v1/1/filter.php?c=${categoria}`;
    try {
        const response = await fetch(urlCat);
        if (!response.ok) { throw Error()}
        const json = await response.json();
        mostrarRecetas(json);
    }
    catch (error) {
        console.log(error);
    }
}

//muestra la lista de platillos por categoria
function mostrarRecetas(json) {
    console.log(json);

    document.getElementById("receta").innerHTML = "";

    let body = "";
    let am = json.meals;//array de comidas
    for(let i = 0; i < am.length; i++) {
        body += `<h4 style="margin: 10px; cursor: pointer;" id="${am[i].strMeal}">${am[i].strMeal}</h4>`;
    }
    
    document.getElementById("comidas").innerHTML = body;

    for(let i = 0; i < am.length; i++) {
        document.getElementById(`${am[i].strMeal}`).addEventListener("click", function() {fetchReceta(am[i].idMeal);});
    }
    console.log(body);
}

//a traves de la url recupera datos sobre el platillo
const fetchReceta = async (idComida) => {
    let urlReceta = `https://www.themealdb.com/api/json/v1/1/lookup.php?i=${idComida}`;
    try {
        const response = await fetch(urlReceta);
        if (!response.ok) { throw Error()}
        const json = await response.json();
        mostrarReceta(json);
    }
    catch (error) {
        console.log(error);
    }
}

//muestra los datos del platillo seleccionado
function mostrarReceta(json) {
    console.log(json);

    let body = "";
    let dReceta = json.meals[0];//datos de receta
    
    body += `<h2 style="color: gray">${dReceta.strMeal}</h2>
             <img style="width: 300px;   float: left; padding: 10px"
                src="${dReceta.strMealThumb}"/>
            <h5 style="color: yellow; padding: 10px, 0px; ">How to prepare?</h5>
            <p style="padding: 10px, 0px; width: 800px; height:300px; text-align: justify;">${dReceta.strInstructions}</p>`;
    
    document.getElementById("receta").innerHTML = body;
    console.log("--------");
    console.log(body);
}