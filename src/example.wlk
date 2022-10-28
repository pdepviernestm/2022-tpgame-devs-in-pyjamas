import wollok.game.*

class plataforma{
	const property position
  	const property image = "p50.png"
}

const p0 = new plataforma(position=game.at(0,0))
const p1 = new plataforma(position=game.at(1,0))
const p2 = new plataforma(position=game.at(2,0))
const p3 = new plataforma(position=game.at(3,0))
const p4 = new plataforma(position=game.at(4,0))
const p5 = new plataforma(position=game.at(5,0))
const p6 = new plataforma(position=game.at(6,0))
const p7 = new plataforma(position=game.at(7,0))
const p8 = new plataforma(position=game.at(8,0))
const p9 = new plataforma(position=game.at(9,0))
const p10 = new plataforma(position=game.at(10,0))
const p11 = new plataforma(position=game.at(11,0))
const p12 = new plataforma(position=game.at(12,0))


const p13 = new plataforma(position=game.at(0,3))
const p14 = new plataforma(position=game.at(1,3))
const p15 = new plataforma(position=game.at(2,3))
const p16 = new plataforma(position=game.at(3,3))
const p17 = new plataforma(position=game.at(4,3))
const p18 = new plataforma(position=game.at(5,3))
const p19 = new plataforma(position=game.at(6,3))
const p20 = new plataforma(position=game.at(7,3))
const p21 = new plataforma(position=game.at(8,3))
const p22 = new plataforma(position=game.at(9,3))
const p23 = new plataforma(position=game.at(10,3))
const p24 = new plataforma(position=game.at(11,3))
const p25 = new plataforma(position=game.at(12,3))

const p26 = new plataforma(position=game.at(0,6))
const p27 = new plataforma(position=game.at(1,6))
const p28 = new plataforma(position=game.at(2,6))
const p29 = new plataforma(position=game.at(3,6))
const p30 = new plataforma(position=game.at(4,6))
const p31 = new plataforma(position=game.at(5,6))
const p32 = new plataforma(position=game.at(6,6))
const p33 = new plataforma(position=game.at(7,6))
const p34 = new plataforma(position=game.at(8,6))
const p35 = new plataforma(position=game.at(9,6))
const p36 = new plataforma(position=game.at(10,6))
const p37 = new plataforma(position=game.at(11,6))
const p38 = new plataforma(position=game.at(12,6))




object mario{
	var property position = game.at(0,1)
  	const property image = "mario.png"
  	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}	
	//method mover(direccion,personaje){
    //    personaje.position(direccion.siguiente(personaje.position()))
    //}
}


object donkeyKong{
	const property position = game.at(5,10)
  	const property image = "DK200.png"
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


