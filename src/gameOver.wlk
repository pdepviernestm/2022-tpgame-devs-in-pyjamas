import wollok.game.*
import mario.*
import nivel1.*

object gameOver {
	method cargar()	{
		marioDead.position(mario.position())
		game.clear()
		game.addVisual(marioDead)
		marioDead.animacionMuerte()
	}
	
    method pantallaDeGameOver(){
        game.schedule(3000,{game.removeVisual(marioDead)})
        game.schedule(10000,{game.addVisual(pantallaGameOver)}) 
        game.schedule(15000,{game.removeVisual(pantallaGameOver)})
        game.schedule(15000,{home.cargar()})
    }

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