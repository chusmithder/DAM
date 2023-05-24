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
document.getElementById("btnSave").addEventListener("click", insertarPrograma);
var programas = [];
function insertarPrograma() {
    var nombre = document.getElementById("name");
    var p = new Programa(nombre.value, "1.0");
    programas.push(p);
    document.getElementById("demo").innerHTML += p.getNombre() + "<br>";
}
