import wollok.game.*





object mario{
	var property position = game.at(5,5)
  	const property image = "mario.png"
  	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}	
	//method mover(direccion,personaje){
    //    personaje.position(direccion.siguiente(personaje.position()))
    //}
    method bajar(n){
    	position= position.down(1)
    }
}


object donkeyKong{
	const property position = game.at(3,16)
  	const property image = "DK200_OK.png"
}

object mate{
	const property position = game.at(5,3)
  	const property image = "mate50.png"
}

class Escalera{
	const property position
  	const property image = "escalera.png"
}

const e18 = new Escalera(position=game.at(1,8))
const e28 = new Escalera(position=game.at(2,8))

const e41 = new Escalera(position=game.at(4,1))
const e42 = new Escalera(position=game.at(4,2))
const e43 = new Escalera(position=game.at(4,3))
const e44 = new Escalera(position=game.at(4,4))

class Barril{
	const property position
  	const property image
}

class BarrilComun inherits Barril(image = "barrilComun.png",position = game.at(9,7)){
}

const bco1 = new BarrilComun()
const bn1 = new BarrilNegro()
const bv1 = new BarrilVerde()
const bce1 = new BarrilCeleste()

class BarrilNegro inherits Barril(image = "barrilNegro.png",position = game.at(3,7)){
}

class BarrilVerde inherits Barril(image = "barrilVerde.png",position = game.at(7,7)){
}

class BarrilCeleste inherits Barril(image = "barrilCeleste.png",position = game.at(5,7)){
}


//object movimiento {
//	
//	method configurarFlechas(visual){
//		keyboard.up().onPressDo{self.mover(arriba,visual)}
//		keyboard.down().onPressDo{self.mover(abajo,visual)}
//		keyboard.left().onPressDo{self.mover(izquierda,visual)}
//		keyboard.right().onPressDo{self.mover(derecha,visual)}
//   }
//	
//	method mover(direccion,personaje){
//		personaje.position(direccion.siguiente(personaje.position()))
//	}	
//	
//}
//
//object izquierda { 
//	method siguiente(position) = position.left(1) 
//}
//
//object derecha { 
//	method siguiente(position) = position.right(1) 
//}
//
//object abajo { 
//	method siguiente(position) = position.down(1) 
//}
//
//object arriba { 
//	method siguiente(position) = position.up(1) 
//}


