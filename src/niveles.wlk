import wollok.game.*
import plataformas.*

const ancho = game.width() - 1
const largo = game.height() - 1

	
	object nivel1{
		method cargar(){
			
			//Plataformas
			const posPlataformas = []
			(1..18).forEach{n=>posPlataformas.add(new Position(x=n,y=0))}
			(1..18).forEach{n=>posPlataformas.add(new Position(x=n,y=3))}
			(1..18).forEach{n=>posPlataformas.add(new Position(x=n,y=6))}
			(1..18).forEach{n=>posPlataformas.add(new Position(x=n,y=9))}
			(1..18).forEach{n=>posPlataformas.add(new Position(x=n,y=12))}
			(1..18).forEach{n=>posPlataformas.add(new Position(x=n,y=15))}
			(8..12).forEach{n=>posPlataformas.add(new Position(x=n,y=17))}
			
			posPlataformas.forEach { p => self.dibujar(new Plataforma(position = p)) }
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

