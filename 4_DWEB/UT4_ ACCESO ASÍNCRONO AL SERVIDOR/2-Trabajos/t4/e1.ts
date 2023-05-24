class Vehiculo {
    constructor(protected ruedas: number, private color: string) {   
    }

    protected getRuedas(): number {
        return this.ruedas;
    }

    protected getColor(): string {
        return this.color;
    }
}

class Camion extends Vehiculo {
    constructor(private tara: number, color: string, ruedas: number) {
        super(ruedas, color);
    }

    getTara(): number {
        return this.tara;
    }

    printDetalles(): void {
        alert(`Ruedas: ${this.ruedas} \nColor: ${this.getColor} \nTara: ${this.tara}`);
    }
}



const c1: Camion = new Camion(5000, "rojo", 6);
document.getElementById("demo").innerHTML = `${JSON.stringify(c1)}`;