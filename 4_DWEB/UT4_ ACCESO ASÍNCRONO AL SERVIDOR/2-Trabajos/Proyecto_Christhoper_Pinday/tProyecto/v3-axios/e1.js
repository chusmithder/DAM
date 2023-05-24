// https://themealdb.com/api.php
//todas las categorias
var listCategories = "https://www.themealdb.com/api/json/v1/1/categories.php"; //obtendremos nombre de categoria

axios({
    method: 'GET',
    url: listCategories
}).then(res => {
    mostrarCategorias(res.data);
}).catch(err => console.log(err))

function mostrarCategorias(json) {
    console.log(json);
    var body = "";
    var ac = json.categories; //array de categorias
    for (var i = 0; i < ac.length; i++) {
        body += "<div id=\"".concat(ac[i].strCategory, "\" \n                    style=\"width: 150px; height=100px; cursor: pointer; text-align: center; border: 3px solid #73AD21; border-radius: 12px; margin: 4px 2px;\" >\n                    <h3>").concat(ac[i].strCategory, "</h3>\n                    <img src=\"").concat(ac[i].strCategoryThumb, "\" style=\"width: 150px;\"/>\n                </div>");
    }
    document.getElementById("principal").innerHTML = body;
    var _loop_1 = function (i) {
        var e = document.getElementById("".concat(ac[i].strCategory));
        //eventos
        e.addEventListener("click", function () { fetchComidas(ac[i].strCategory); });
    };
    for (var i = 0; i < ac.length; i++) {
        _loop_1(i);
    }
    console.log(body);
}


function fetchComidas(categoria) {
    var urlCat = "https://www.themealdb.com/api/json/v1/1/filter.php?c=".concat(categoria);
    axios({
        method: 'GET',
        url: urlCat
    }).then(res => {
        mostrarRecetas(res.data);
    }).catch(err => console.log(err))
}

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
function fetchReceta(idComida) {
    var urlReceta = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=".concat(idComida);
    axios({
        method: 'GET',
        url: urlReceta
    }).then(res => {
        mostrarReceta(res.data);
    }).catch(err => console.log(err))
}

function mostrarReceta(json) {
    console.log(json);
    var body = "";
    var dReceta = json.meals[0]; //datos de receta
    body += `<h2 style="color: gray">${dReceta.strMeal}</h2>
             <img style="width: 300px;   float: left; padding: 10px"
                src="${dReceta.strMealThumb}"/>
            <h5 style="color: yellow; padding: 10px, 0px; ">How to prepare?</h5>
            <p style="padding: 10px, 0px; width: 800px; height:300px; text-align: justify;">${dReceta.strInstructions}</p>`;
    document.getElementById("receta").innerHTML = body;
    console.log("--------");
    console.log(body);
}
