function esPar(num: number): boolean {
    return num % 2 == 0;
}
document.getElementById("demo").innerHTML += "4 es par?: " + esPar(4) + "<br>";

function concatenar(s1: string, s2: string, s3: string): string {
    return `${s1} - ${s2} - ${s3}`;
}
document.getElementById("demo").innerHTML += "Concatenacion de uno dos tres: " + concatenar("1", "2", "3") + "<br>";

let getSum = (n1: number, n2: number) => {return n1 + n2}
document.getElementById("demo").innerHTML += `1 + 10 = ${getSum(1, 10)} <br>`;



