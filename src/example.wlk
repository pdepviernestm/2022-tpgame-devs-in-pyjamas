import wollok.game.*

object fondo {
  var property position = game.origin()
  const property image = "fondo.jpg"
  //method image() = "fondo.jpg"
}

object plataforma {
  var property position = game.origin()
  const property image = "plataforma.png"
  //method image() = "fondo.jpg"
}

object plataforma2 {
  var property position = game.at(3,0)
  const property image = "plataforma.png"
  //method image() = "fondo.jpg"
}

/*

object movimiento {
	
	method configurarFlechas(visual){
		keyboard.up().onPressDo{ self.mover(arriba,visual)}
		keyboard.down().onPressDo{ self.mover(abajo,visual)}
		keyboard.left().onPressDo{ self.mover(izquierda,visual)}
		keyboard.right().onPressDo{self.mover(derecha,visual)}
    keyboard.space().onPressDo{self.mover(algo, visual }
   }
	
	method mover(direccion,personaje){
		personaje.position(direccion.siguiente(personaje.position()))
	}	
	
}

object izquierda { 
	method siguiente(position) = position.left(1) 
}

object derecha { 
	method siguiente(position) = position.right(1) 
}

object abajo { 
	method siguiente(position) = position.down(1) 
}

object arriba { 
	method siguiente(position) = position.up(1) 
}





    movimiento.configurarFlechas(granjero)


		keyboard.m().onPressDo { granjero.plantaMaiz() }
		keyboard.t().onPressDo { granjero.plantaTrigo() }
		keyboard.o().onPressDo { granjero.plantaTomaco() }
		keyboard.r().onPressDo { granjero.rega() }
		keyboard.c().onPressDo { granjero.cosechaTodo() }
		
		keyboard.space().onPressDo{ game.say(granjero, "mi oro: " + granjero.oro()) }  


*/