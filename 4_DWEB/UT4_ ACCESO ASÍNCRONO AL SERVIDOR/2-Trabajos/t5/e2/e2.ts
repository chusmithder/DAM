class Programa {
    constructor (protected nombre: string, protected version: string) {
    }

    public getNombre(): string {
        return this.nombre;
    }

    public getVersion(): string {
        return this.version;
    }

    public setNombre(nombre: string): void {
        this.nombre = nombre;
    }
    public setVersion(version: string): void {
        this.version = version;
    }
}

class EditorVideo extends Programa {
    constructor(nombre: string, version: string, protected timeline: string) {
        super(nombre, version);
    }

    public getTimeline(): string {
        return this.timeline;
    }
    public setTimeline(timeline: string): void {
        this.timeline = timeline;
    }
    public printDatos(): string {
        return `Nombre: ${this.nombre} / Version: ${this.version} / Timeline: ${this.timeline}`;
    }

}


document.getElementById("btnSave").addEventListener("click", insertarPrograma);

const programas: Programa[] = [];

function insertarPrograma(): void {
    let nombre = <HTMLInputElement>document.getElementById("name");
    const p = new Programa(nombre.value, "1.0");
    programas.push(p);
    document.getElementById("demo").innerHTML += p.getNombre() + "<br>";
}



