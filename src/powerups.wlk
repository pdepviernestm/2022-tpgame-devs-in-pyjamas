import wollok.game.*
import mario.*
import nivel1.*

class PowerUp{
	var property position
	var property image
	
	method puedePisarse() = false
	method esEscalera() = false
	method esPlataforma() = false
	method esBarril()=false
	method esPowerUp()=true
	method iniciar(){
		game.addVisual(self)
		game.schedule(10000, {if(game.hasVisual(self)) game.removeVisual(self)})
		//game.sound("powerup.mp3").play()		
	}
	method efecto(){}		
}

class Estrella inherits PowerUp(image = "estrella50.png"){
	override method efecto(){
		mario.invencible(true)
		game.schedule(10000,{mario.invencible(false)})
		//game.sound("A_Secret_Course.mp3").play()
		//game.schedule(10000,{game.sound("A_Secret_Course.mp3").stop()})
	}
}

class Mate inherits PowerUp(image = "mate50.png") {
	override method efecto(){
		mario.recuperar(5)
	}
}

class HonguitoRojo inherits PowerUp(image = "mariosaltaizq.png"){  
	override method efecto(){
		mario.recuperar(1)
	}
}

class HonguitoVerde inherits PowerUp(image = "honguitoVerde.png"){  
	override method efecto(){
		mario.invertido(1)
		game.schedule(5000,{mario.invertido(0)})
	}
}

class Espada inherits PowerUp {
	
//	override method efecto(){
//		
//		mario.invencible()
		// QUE SUENE LA CANCION DEL MONKEY LOKO :P
//	}
			//SI LO HACEMOS CON EL CODE DE KONAMI TIENE QUE SER OBJETO
		
}

//object caja {
//  var property position = game.center()
//  method image() = "caja.png"
//  method movete() {
//    const x = 0.randomUpTo(game.width()).truncate(0)
//    const y = 0.randomUpTo(game.height()).truncate(0)
//    // otra forma de generar números aleatorios
//    // const x = (0.. game.width()-1).anyOne() 
//    // const y = (0.. game.height()-1).anyOne() 
//    position = game.at(x,y) 
//  }
//}