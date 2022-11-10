import wollok.game.*
import direcciones.*
import consultas.*
import mario.*
import nivel1.*

class Barril{
    var property position = game.at(5,16)
    var property image = animations.get(0)
    var property animations
    var property string = nivel1.contadorBarriles().toString()
    
    var indice = 0
    const property velocidad = 100
    var property direccionActual = derecha
    method mover(direccion){
        if(position.y() < -1){if (game.hasVisual(self)) self.detener()}
        else{
        	if(consulta.existePlataforma(self)){
        	position = direccionActual.siguiente(position) 
        	self.cambiarImagen()
        }
	        else{
	            position = abajo.siguiente(position)
	            if(position.x() == 18 || position.x() == 1) direccionActual = direccionActual.opuesto()
	        }
        }
    }
    method cambiarImagen(){
        if(indice<3) indice=indice+1 else indice=0
        image=animations.get(indice)
    }
    method puedePisarse() = false
    method esEscalera() = false
    method esPlataforma() = false
    method esBarril() = true
    method iniciar(){
        game.addVisual(self)
        game.onTick(velocidad,string,{self.mover(direccionActual)})
    }
    method detener(){
        game.removeVisual(self)
        game.removeTickEvent(string)
    }
	method efecto(){mario.danio(1)}
}

class BarrilComun inherits Barril(image = "barrilComun.png",animations=["comun1.png","comun2.png","comun3.png","comun4.png"]){
}

class BarrilNegro inherits Barril(image = "barrilNegro.png",animations=["barrilNegro1.png","barrilNegro2.png","barrilNegro3.png","barrilNegro4.png"]){
	override method efecto(){mario.danio(3)}
}

class BarrilVerde inherits Barril(image = "barrilVerde.png",animations=["barrilVerde.png","barrilVerde.png","barrilVerde.png","barrilVerde.png"]){
	override method efecto(){
		game.schedule(3000,{mario.danio(1)})
		game.schedule(6000,{mario.danio(1)})
		game.schedule(9000,{mario.danio(1)})
		}
}

class BarrilCeleste inherits Barril(image = "barrilCeleste.png",animations=["barrilCeleste.png","barrilCeleste.png","barrilCeleste.png","barrilCeleste.png"]){
	override method efecto(){
		const posicionActual = mario.position()
		mario.stun(true)
		game.onTick(50,"stun",{if(mario.position() != posicionActual) mario.position(posicionActual)})
		game.schedule(3000,{game.removeTickEvent("stun") mario.stun(false)})
	}
}