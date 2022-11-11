import wollok.game.*
import mario.*
import nivel1.*
import home.*

object gameOver {
	method cargar()	{
		marioDead.position(mario.position())
		game.clear()
		game.addVisual(marioDead)
		marioDead.animacionMuerte()
		self.pantallaDeGameOver()
	}
	
    method pantallaDeGameOver(){
        game.schedule(5000,{
        	game.removeVisual(marioDead)
        	game.addVisual(pantallaGameOver)
        	game.addVisual(cursorGameOver)
	        keyboard.up().onPressDo({cursorGameOver.subir()})
	    	keyboard.down().onPressDo({cursorGameOver.bajar()})
	    	keyboard.enter().onPressDo({cursorGameOver.seleccionar()})})
    }
}

object cursorGameOver{
	var property position= game.at(5,4)
	const property image= "cursor.png"
	
	method subir(){
		if (self.position().y()<4) {position=position.up(2) pantallaGameOver.image("retry.png")}
	}
	method bajar(){
		if (self.position().y()>2) {position=position.down(2) pantallaGameOver.image("mainmenu.png")}
	}
	method seleccionar(){
		if (self.position().y()==4){game.clear() nivel1.cargar()}
		if (self.position().y()==2){game.clear() game.schedule(1,{home.cargar()})}
	}
}

object pantallaGameOver{
	const property position = game.at(0,0)
	var property image = "retry.png"
}

object marioDead{
	var property position
	var property image= "deadleft.png"
	var property muertes=["deadleft.png","deaddown.png","deadright.png","deadup.png"]
	var property contadorMuerte= 0
	
	method animacionMuerte(){
		game.onTick(200,"muerte",{self.cambiarImagenMuerte()})
		game.schedule(2000,{game.removeTickEvent("muerte")})
		game.schedule(2001,{image ="marioaureola.png"})
	}
	
	method cambiarImagenMuerte(){
		if (contadorMuerte<3){contadorMuerte= contadorMuerte+1}
		else contadorMuerte=0
		image=self.muertes().get(contadorMuerte)
	}
}