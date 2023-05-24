function esPar(num) {
    return num % 2 == 0;
}
document.getElementById("demo").innerHTML += "4 es par?: " + esPar(4) + "<br>";
function concatenar(s1, s2, s3) {
    return "".concat(s1, " - ").concat(s2, " - ").concat(s3);
}
document.getElementById("demo").innerHTML += "Concatenacion de uno dos tres: " + concatenar("1", "2", "3") + "<br>";
var getSum = function (n1, n2) { return n1 + n2; };
document.getElementById("demo").innerHTML += "1 + 10 = ".concat(getSum(1, 10), " <br>");
