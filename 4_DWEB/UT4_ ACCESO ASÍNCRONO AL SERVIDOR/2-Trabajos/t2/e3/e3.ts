var contador;
contador = 1;

while (contador < 5) {
    let dato = prompt("Introduce numero del 1 al 10:", "");
    let num = Number(dato);


    document.write(`El numero introducido es ${num} </br>`);
    document.write(`El contador es ${contador} </br>`);

    contador++;
}

document.write(`</br><h2>
                Fin del programa
                contador ya NO es menor que 5.
                </h2>`);

// document.write(`</br>Ulrimo numeo introducido es ${num}`);

//debido a que num tiene ambito de bloque