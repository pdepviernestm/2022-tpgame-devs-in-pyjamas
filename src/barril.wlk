import wollok.game.*
import direcciones.*
import plataformas.*
import niveles.*
import consultas.*

class Barril{
	var property position = game.at(5,16)
  	const property image
	const property velocidad = 100
	var property direccionActual = derecha
	method mover(direccion){
		if(consulta.existePlataforma(self)) position = direccionActual.siguiente(position)
		else{
			position = abajo.siguiente(position)
			if(position.x() == 18 || position.x() == 1) direccionActual = direccionActual.opuesto()
			}
		if(position.y() < -1){self.detener()}
	}
	method puedePisarse() = false
	method iniciar(){
		game.onTick(velocidad,"moverBarril",{self.mover(direccionActual)})
	}
	method detener(){
		game.removeVisual(self)
		game.removeTickEvent("moverBarril")
	}
}

class BarrilComun inherits Barril(image = "barrilComun.png"){
	
}

class BarrilNegro inherits Barril(image = "barrilNegro.png"){
}

class BarrilVerde inherits Barril(image = "barrilVerde.png"){
}

class BarrilCeleste inherits Barril(image = "barrilCeleste.png",position = game.at(5,7)){
}

const bco1 = new BarrilComun()
const bn1 = new BarrilNegro()
const bv1 = new BarrilVerde()
const bce1 = new BarrilCeleste()