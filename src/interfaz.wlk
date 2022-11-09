import wollok.game.*
import corazones.*

object interfaz{
	const property corazones = [corazon1,corazon2,corazon3,corazon4,corazon5]
	method dibujar(dibujo){
		game.addVisual(dibujo)
		return dibujo
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method cargar(){
		//(14..18).forEach{n=>posCorazones.add(new Position(x=10,y=n))}
	}
}