import wollok.game.*
import plataformas.*
import escalera.*

object nivel1{
	const property posPlataformas = []
	const property posEscaleras = []
	method cargar(){
		//Plataformas
		(1..18).forEach{n=>posPlataformas.add(new Position(x=n,y=0))}
		(1..17).forEach{n=>posPlataformas.add(new Position(x=n,y=3))}
		(2..18).forEach{n=>posPlataformas.add(new Position(x=n,y=6))}
		(1..17).forEach{n=>posPlataformas.add(new Position(x=n,y=9))}
		(2..18).forEach{n=>posPlataformas.add(new Position(x=n,y=12))}
		(1..17).forEach{n=>posPlataformas.add(new Position(x=n,y=15))}
		(8..12).forEach{n=>posPlataformas.add(new Position(x=n,y=17))}
		posPlataformas.forEach{p => self.dibujar(new Plataforma(position = p))}
		//Escaleras
		(1..3).forEach{n=>posEscaleras.add(new Position(x=17,y=n))}
		(4..6).forEach{n=>posEscaleras.add(new Position(x=5,y=n))}
		(7..9).forEach{n=>posEscaleras.add(new Position(x=2,y=n))}
		(10..12).forEach{n=>posEscaleras.add(new Position(x=17,y=n))}
		(13..15).forEach{n=>posEscaleras.add(new Position(x=13,y=n))}
		(16..17).forEach{n=>posEscaleras.add(new Position(x=10,y=n))}
		posEscaleras.forEach{p => self.dibujar(new Escalera(position = p))}
		}
		method dibujar(dibujo) {
			game.addVisual(dibujo)
			return dibujo
		}
		method restart() {
			game.clear()
			self.cargar()
		}
}

object interfaz{
	const property posCorazones = []
	method dibujar(dibujo){
		game.addVisual(dibujo)
		return dibujo
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method cargar(){
		(14..18).forEach{n=>posCorazones.add(new Position(x=10,y=n))}
	}
	

}

class Corazon{
	const property position
  	var property image = "corLleno.png"
	method cambiar(){
		//removeVisual()
		image = "corVacio.png"
	}
}

const corazon1 = new Corazon(position = game.at(14,18))
const corazon2 = new Corazon(position = game.at(15,18))
const corazon3 = new Corazon(position = game.at(16,18))
const corazon4 = new Corazon(position = game.at(17,18))
const corazon5 = new Corazon(position = game.at(18,18))