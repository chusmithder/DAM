// {
// interface Book {
//     id: number;
//     title: string;
//     author: string;
//     // coauthor?: string;
//     // isLoan: (id: number) => void
// }
var coche1 = {
    color: "rojo",
    ruedas: 4,
    getRuedas: function () {
        return this.ruedas;
    },
    getColor: function () {
        return this.color;
    }
};
document.getElementById("demo").innerHTML += JSON.stringify(coche1) + "<br>";
var MyClass = /** @class */ (function () {
    function MyClass() {
        this.color = "rojo";
        this.ruedas = 4;
        this.tara = 5000;
        this.getRuedas = function () { return this.ruedas; };
        this.getColor = function () { return this.color; };
    }
    return MyClass;
}());
document.getElementById("demo").innerHTML += JSON.stringify(new MyClass()) + "<br>";
