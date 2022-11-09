import wollok.game.*
import mario.*


class PowerUps{
	
	var property posicion
	var property image
	
	
	method iniciar(){
		game.addVisual(self)
		game.schedule(5000, {game.removeVisual(self)})
		game.onCollideDo(mario, {power => power.efecto()}    )
	}

	method efecto(){}
			
}

class Mate inherits PowerUps { // ver si ponemos como objeto o class

	
	override method efecto(){
		//mario.subirVida(5) ===>> PENSAR BIEN
	
	}
}

class HonguitoRojo inherits PowerUps {  
	
	override method efecto(){
		//mario.subirVida(1)
	}
}

class HonguitoVerde inherits PowerUps {  
	
	override method efecto(){
		mario.invertido(1)
		game.schedule(5000,{mario.invertido(0)})
	}

}

class Espada inherits PowerUps {
	
//	override method efecto(){
//		
//		mario.invecible()
		// QUE SUENE LA CANCION DEL MONKEY LOKO :P
//	}
			//SI LO HACEMOS CON EL CODE DE KONAMI TIENE QUE SER OBJETO
		
}
	

// 


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
}