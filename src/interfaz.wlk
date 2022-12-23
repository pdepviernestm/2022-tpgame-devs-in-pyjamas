import wollok.game.*
import corazones.*

object interfaz{
	const property corazones = [corazon1,corazon2,corazon3,corazon4,corazon5]
//	method restart() {
//		game.clear()
//		self.cargar()
//	}
	method cargar(){
		game.addVisual(corazon1)
		game.addVisual(corazon2)
		game.addVisual(corazon3)
		game.addVisual(corazon4)
		game.addVisual(corazon5)
	}
}