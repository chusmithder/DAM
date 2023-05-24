let nombre: string = "Chris";
let numero: number = 23;
let valor: boolean = false;
let obj: any = "valor";

let arrayNumber: number[] = [1,2,3,4,5];
let arrayString: string[] = ["a", "b", "c", "d", "e"];
let arrayBoolean: boolean[] = [true, false, true, false];
let arrayAny: any[] = ["Hola", 3, false];

let tupla: [string, string, number, string];
tupla = ["Irak", "Bagdad", 41000000, "árabe"];

let resul1: string = "";
for (let i in tupla) {
    resul1 += i + "<br>"
}
// document.getElementById("demo").innerHTML = resul1;

let myUnions: string | number | null;
myUnions = "1 posible valor";

enum myEnum {
    One = 1,
    Two,
    Three,
    Four
};

type Person =  {
    name: string;
     age: number;
    };

    document.getElementById("demo")!.innerHTML =  
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