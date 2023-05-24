var nombre = "Chris";
var numero = 23;
var valor = false;
var obj = "valor";
var arrayNumber = [1, 2, 3, 4, 5];
var arrayString = ["a", "b", "c", "d", "e"];
var arrayBoolean = [true, false, true, false];
var arrayAny = ["Hola", 3, false];
var tupla;
tupla = ["Irak", "Bagdad", 41000000, "árabe"];
var resul1 = "";
for (var i in tupla) {
    resul1 += i + "<br>";
}
// document.getElementById("demo").innerHTML = resul1;
var myUnions;
myUnions = "1 posible valor";
var myEnum;
(function (myEnum) {
    myEnum[myEnum["One"] = 1] = "One";
    myEnum[myEnum["Two"] = 2] = "Two";
    myEnum[myEnum["Three"] = 3] = "Three";
    myEnum[myEnum["Four"] = 4] = "Four";
})(myEnum || (myEnum = {}));
;
document.getElementById("demo").innerHTML =
    "La variable <em> string </em> es: " + nombre + "<br>" +
        "La variable <em> number </em> es: " + numero + "<br>" +
        "La variable <em> boolean </em> es: " + valor + "<br>" +
        "La variable <em> any </em> es: " + obj + "<br>" +
        "El <em> array de números </em> es: " + arrayNumber + "<br>" +
        "El <em> array de string </em> es: " + arrayString + "<br>" +
        "El <em> array de valores booleanos </em> es: " + arrayBoolean + "<br>" +
        "El <em> array de cualquier tipo </em> es: " + arrayAny + "<br>" +
        "La <em> tupla </em> con los datos de un pais es: " + tupla[0] + ", " + tupla[1] + ", " + tupla[2] + ", " + tupla[3] + "<br>" +
        "La informacion del <em> enum </em> es: " + myEnum.One + ", " + myEnum.Two + ", " + myEnum.Three + ", " + myEnum.Four;
