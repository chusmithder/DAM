// {
// interface Book {
//     id: number;
//     title: string;
//     author: string;
//     // coauthor?: string;
//     // isLoan: (id: number) => void
// }

// const book: Book = {
//     id: 11,
//     title: "My libro",
//     author: "Chris"
// };

// const books: Book[] = [];

// function getBook1() {
//     return {id: 1, title: "Derechos del gato"};
// }

// function getBook2(): Book {
//     return {id: 1, title: "Derechos del gato", author: "asdasd"};
// }

// interface Person {
//     id: number;
//     name: string;
// }

// // interface Employee {
// //     id: number,
// //     name: string,
// //     dept: string
// // }

// // interface Customer {
// //     id: number,
// //     name: string,
// //     country: string
// // }

// interface Employee extends Person{
//     dept: string;
// }

// interface Customer extends Person {
//     country: string;
// }

// const emp: Employee	= {id: 12, name: "Valeria", dept: "ventas"};

// interface Animal {
//     name: string;
//     getDogs: (number) => number
//     getCats: () => void;
// }

// class Zoo implements Animal {
//     name = "Valeria";
//     getDogs = () => {};
//     getCats= () => {};
// }
// }

interface Vehiculo {
    color: string;
    ruedas: number;
    getRuedas: () => number;
    getColor: () => string;
}

const coche1: Vehiculo = {
    color: "rojo",
    ruedas: 4,
    getRuedas(): number {
        return this.ruedas;
    },
    getColor(): string {
        return this.color;
    }
};

document.getElementById("demo").innerHTML += JSON.stringify(coche1) + "<br>";

interface Camion extends Vehiculo {
    tara: number;
}

class MyClass implements Camion {
    color = "rojo";
    ruedas =  4;
    tara = 5000;
    getRuedas = function() {return this.ruedas}
    getColor =  function() {return this.color};
}

document.getElementById("demo").innerHTML += JSON.stringify(new MyClass()) + "<br>";