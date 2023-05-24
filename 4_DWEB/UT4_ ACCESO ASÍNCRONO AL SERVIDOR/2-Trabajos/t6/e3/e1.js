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
var Programa = /** @class */ (function () {
    function Programa(nombre, version) {
        this.nombre = nombre;
        this.version = version;
    }
    Programa.prototype.getNombre = function () {
        return this.nombre;
    };
    Programa.prototype.getVersion = function () {
        return this.version;
    };
    Programa.prototype.setNombre = function (nombre) {
        this.nombre = nombre;
    };
    Programa.prototype.setVersion = function (version) {
        this.version = version;
    };
    return Programa;
}());
var EditorVideo = /** @class */ (function (_super) {
    __extends(EditorVideo, _super);
    function EditorVideo(nombre, version, timeline) {
        var _this = _super.call(this, nombre, version) || this;
        _this.timeline = timeline;
        return _this;
    }
    EditorVideo.prototype.getTimeline = function () {
        return this.timeline;
    };
    EditorVideo.prototype.setTimeline = function (timeline) {
        this.timeline = timeline;
    };
    EditorVideo.prototype.printDatos = function () {
        return "Nombre: ".concat(this.nombre, " / Version: ").concat(this.version, " / Timeline: ").concat(this.timeline);
    };
    return EditorVideo;
}(Programa));
var programas = [];
function insertarPrograma() {
    var nombre = document.getElementById("name");
    if (nombre.value != "") {
        var p = new Programa(nombre.value, "1.0");
        programas.push(p);
        document.getElementById("demo1").innerHTML += p.getNombre() + "<br>";
    }
    else {
        alert("Debes introducir el nombre del programa");
    }
}
function mostrarEnTabla() {
    var p2 = document.getElementById("demo2");
    var tbl = document.createElement("table");
    var tblBody = document.createElement("tbody");
    var row = document.createElement("tr");
    var cell1 = document.createElement("td");
    var cell2 = document.createElement("td");
    var cellText1 = document.createTextNode("N\u00FAmero");
    var cellText2 = document.createTextNode("Nombre del programa");
    cell1.appendChild(cellText1);
    cell2.appendChild(cellText2);
    row.appendChild(cell1);
    row.appendChild(cell2);
    tblBody.appendChild(row);
    tbl.appendChild(tblBody);
    for (var i = 0; i < programas.length; i++) {
        var row_1 = document.createElement("tr");
        var cell1_1 = document.createElement("td");
        var cell2_1 = document.createElement("td");
        var cellText1_1 = document.createTextNode("".concat(i + 1));
        var cellText2_1 = document.createTextNode("".concat(programas[i].getNombre()));
        cell1_1.appendChild(cellText1_1);
        cell2_1.appendChild(cellText2_1);
        row_1.appendChild(cell1_1);
        row_1.appendChild(cell2_1);
        tblBody.appendChild(row_1);
    }
    tbl.appendChild(tblBody);
    tbl.setAttribute("border", "2");
    p2.appendChild(tbl);
}
document.getElementById("btnSave").addEventListener("click", insertarPrograma);
document.getElementById("btnMostrar").addEventListener("click", mostrarEnTabla);
