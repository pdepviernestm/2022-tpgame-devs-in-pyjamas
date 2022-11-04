import wollok.game.*
import consultas.*

object mario{
	var property position = game.at(5,5)
  	const property image = "mario.png"
  	var property corazones = 3
  	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}	
	//method mover(direccion,personaje){
    //    personaje.position(direccion.siguiente(personaje.position()))
    //}
    method bajar(){
    	//if(consulta.existePlataforma(self)) position = position.up(1)
    	position = position.up(1)
    }
    method saltar(){
    	if(consulta.existePlataforma(self)) game.schedule(500, {position = position.down(1)})
    }
    method danio(n){
    	corazones = (corazones - n).max(0)
    }
    //keyboard.up().onPressDo { mario.move(mario.position().up(1)) }
	//keyboard.down().onPressDo { mario.move(mario.position().down(1)) }
	//keyboard.left().onPressDo { mario.move(mario.position().left(1)) }
	//keyboard.right().onPressDo { mario.move(mario.position().right(1)) }
}
