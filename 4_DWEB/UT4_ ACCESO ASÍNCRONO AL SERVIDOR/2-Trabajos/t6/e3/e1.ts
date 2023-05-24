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




const programas: Programa[] = [];

function insertarPrograma(): void {
    let nombre = <HTMLInputElement>document.getElementById("name");
    if (nombre.value != "") {
        const p = new Programa(nombre.value, "1.0");
        programas.push(p);
        document.getElementById("demo1")!.innerHTML += p.getNombre() + "<br>";
    } else {
        alert("Debes introducir el nombre del programa");
    }   
}

function mostrarEnTabla():void {
    const p2 = document.getElementById("demo2");

    const tbl = document.createElement("table");
    const tblBody = document.createElement("tbody");

    const row = document.createElement("tr");
        const cell1 = document.createElement("td");
        const cell2 = document.createElement("td");
        
        const cellText1 = document.createTextNode(`Número`);
        const cellText2 = document.createTextNode(`Nombre del programa`);
        
        cell1.appendChild(cellText1);
        cell2.appendChild(cellText2);

        row.appendChild(cell1);
        row.appendChild(cell2);

        tblBody.appendChild(row);
        tbl.appendChild(tblBody);
    for (let i = 0; i < programas.length; i++) {
        const row = document.createElement("tr");
        const cell1 = document.createElement("td");
        const cell2 = document.createElement("td");
        
        const cellText1 = document.createTextNode(`${i + 1}`);
        const cellText2 = document.createTextNode(`${programas[i].getNombre()}`);
        
        cell1.appendChild(cellText1);
        cell2.appendChild(cellText2);

        row.appendChild(cell1);
        row.appendChild(cell2);

        tblBody.appendChild(row);
    }
    tbl.appendChild(tblBody);
    tbl.setAttribute("border", "2");
    p2.appendChild(tbl);
    
}

document.getElementById("btnSave").addEventListener("click", insertarPrograma);
document.getElementById("btnMostrar").addEventListener("click", mostrarEnTabla);
