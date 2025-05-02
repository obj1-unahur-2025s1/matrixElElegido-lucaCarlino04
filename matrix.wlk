// Pasajeros

object nave {
    const pasajeros = [neo, morfeo, trinity]
    method pasajeros() = pasajeros
/* -------- Metodos para meter y bajar un pasajero ------------
    method subirANave(unPasajero) {
        pasajeros.add(unPasajero)
    }
    method bajarDeNave(unPasajero) {
        pasajeros.remove(unPasajero)
    }
*/
    method cuantosPasajeros() {
        return pasajeros.size()
    }
    method vitalidadMaxima() {
        return pasajeros.max{ pasajero => pasajero.vitalidad() }
    }
    method estaEquilibrada() {
        return pasajeros.all { pasajero1 =>
            pasajeros.all { pasajero2 =>
                pasajero1.vitalidad() <= pasajero2.vitalidad() * 2
            }
        }
    }
    method estaElElegido() {
        return pasajeros.forEach{ pasajero => pasajero.esElegido()}
    }
    method chocar() { 
        pasajeros.forEach{ pasajero => pasajero.saltar() }
        pasajeros.clear()
    }
    method acelerar() {
        pasajeros.forEach { pasajero => pasajero.saltar() }
    }
}

object neo {
    var energia = 100
    method esElegido() = true
    method vitalidad() = energia / 10
    method saltar() {
        energia = energia / 2
    }
    method subirANave() {
        nave.pasajeros().add(self)
    }
    method bajarDeNave() {
        nave.pasajeros().remove(self)
    }
}

object morfeo {
    var estaCansado = false
    var vitalidad = 8
    method esElegido() = false
    method vitalidad() = vitalidad
    method saltar() {
        estaCansado = !estaCansado        
        vitalidad -= 1
    }
    method subirANave() {
        nave.pasajeros().add(self)
    }
    method bajarDeNave() {
        nave.pasajeros().remove(self)
    }
}

object trinity {
    var vitalidad = 0
    method esElegido() = false
    method vitalidad() = vitalidad
    method saltar() {
        vitalidad -= 0
    }
    method subirANave() {
        nave.pasajeros().add(self)
    }
    method bajarDeNave() {
        nave.pasajeros().remove(self)
    }
}

