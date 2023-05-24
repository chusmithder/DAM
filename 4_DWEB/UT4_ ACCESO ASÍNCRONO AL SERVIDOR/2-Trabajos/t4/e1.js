var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var Vehiculo = /** @class */ (function () {
    function Vehiculo(ruedas, color) {
        this.ruedas = ruedas;
        this.color = color;
    }
    Vehiculo.prototype.getRuedas = function () {
        return this.ruedas;
    };
    Vehiculo.prototype.getColor = function () {
        return this.color;
    };
    return Vehiculo;
}());
var Camion = /** @class */ (function (_super) {
    __extends(Camion, _super);
    function Camion(tara, color, ruedas) {
        var _this = _super.call(this, ruedas, color) || this;
        _this.tara = tara;
        return _this;
    }
    Camion.prototype.getTara = function () {
        return this.tara;
    };
    Camion.prototype.printDetalles = function () {
        alert("Ruedas: ".concat(this.ruedas, " \nColor: ").concat(this.getColor, " \nTara: ").concat(this.tara));
    };
    return Camion;
}(Vehiculo));
var c1 = new Camion(5000, "rojo", 6);
document.getElementById("demo").innerHTML = "".concat(JSON.stringify(c1));
