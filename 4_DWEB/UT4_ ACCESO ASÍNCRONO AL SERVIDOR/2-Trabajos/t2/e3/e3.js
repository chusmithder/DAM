var contador;
contador = 1;
while (contador < 5) {
    var dato = prompt("Introduce numero del 1 al 10:", "");
    var num = Number(dato);
    document.write("El numero introducido es ".concat(num, " </br>"));
    document.write("El contador es ".concat(contador, " </br>"));
    contador++;
}
document.write("</br><h2>\n                Fin del programa\n                contador ya NO es menor que 5.\n                </h2>");
// document.write(`</br>Ulrimo numeo introducido es ${num}`);
//debido a que num tiene ambito de bloque
