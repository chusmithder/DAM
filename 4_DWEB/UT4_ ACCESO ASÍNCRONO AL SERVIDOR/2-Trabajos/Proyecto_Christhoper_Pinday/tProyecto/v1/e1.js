// https://themealdb.com/api.php
//todas las categorias
var listCategories = "https://www.themealdb.com/api/json/v1/1/categories.php"; //obtendremos nombre de categoria
//metodo inicial que a partir de la api llama a la funcion mostrarCategorias
function mostrarDatos() {
    fetch(listCategories)
        .then(function (response) { return response.json(); })
        .then(function (json) { return mostrarCategorias(json); })["catch"](function (error) { return console.log(error); });
}
mostrarDatos();
//muestra todas las categorias
function mostrarCategorias(json) {
    console.log(json);
    var body = "";
    var ac = json.categories; //array de categorias
    //agregamos todas las categorias
    for (var i = 0; i < ac.length; i++) {
        body += "<div id=\"".concat(ac[i].strCategory, "\" \n                    style=\"width: 150px; height=100px; cursor: pointer; text-align: center; border: 3px solid #73AD21; border-radius: 12px; margin: 4px 2px;\" >\n                    <h3>").concat(ac[i].strCategory, "</h3>\n                    <img src=\"").concat(ac[i].strCategoryThumb, "\" style=\"width: 150px;\"/>\n                </div>");
    }
    document.getElementById("principal").innerHTML = body;
    var _loop_1 = function (i) {
        var e = document.getElementById("".concat(ac[i].strCategory));
        e.addEventListener("click", function () { fetchComidas(ac[i].strCategory); });
    };
    //agreagamos eventos a cada categoria
    for (var i = 0; i < ac.length; i++) {
        _loop_1(i);
    }
    console.log(body);
}
//a traves de la url, muestra todos los platillos a partir de la categoria
function fetchComidas(categoria) {
    var urlCat = "https://www.themealdb.com/api/json/v1/1/filter.php?c=".concat(categoria);
    fetch(urlCat)
        .then(function (response) { return response.json(); })
        .then(function (json) { return mostrarRecetas(json); })["catch"](function (error) { return console.log(error); });
}
//muestra la lista de platillos por categoria
function mostrarRecetas(json) {
    console.log(json);
    document.getElementById("receta").innerHTML = "";
    var body = "";
    var am = json.meals; //array de comidas
    for (var i = 0; i < am.length; i++) {
        body += "<h4 style=\"margin: 10px; cursor: pointer;\" id=\"".concat(am[i].strMeal, "\">").concat(am[i].strMeal, "</h4>");
    }
    document.getElementById("comidas").innerHTML = body;
    var _loop_2 = function (i) {
        document.getElementById("".concat(am[i].strMeal)).addEventListener("click", function () { fetchReceta(am[i].idMeal); });
    };
    for (var i = 0; i < am.length; i++) {
        _loop_2(i);
    }
    console.log(body);
}
//a traves de la url recupera datos sobre el platillo
function fetchReceta(idComida) {
    var urlReceta = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=".concat(idComida);
    fetch(urlReceta)
        .then(function (response) { return response.json(); })
        .then(function (json) { return mostrarReceta(json); })["catch"](function (error) { return console.log(error); });
}
//muestra los datos del platillo seleccionado
function mostrarReceta(json) {
    console.log(json);
    var body = "";
    var dReceta = json.meals[0]; //datos de receta
    body += "<h2 style=\"color: gray\">".concat(dReceta.strMeal, "</h2>\n             <img style=\"width: 300px;   float: left; padding: 10px\"\n                src=\"").concat(dReceta.strMealThumb, "\"/>\n            <h5 style=\"color: yellow; padding: 10px, 0px; \">How to prepare?</h5>\n            <p style=\"padding: 10px, 0px; width: 800px; height:300px; text-align: justify;\">").concat(dReceta.strInstructions, "</p>");
    document.getElementById("receta").innerHTML = body;
    console.log("--------");
    console.log(body);
}
