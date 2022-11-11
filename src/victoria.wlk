import wollok.game.*
import mario.*
import home.*

object pantallaGanar{
	var property image = "yoshi1.png"
	var property imagenes = ["yoshi1.png","yoshi2.png","yoshi3.png","yoshi4.png","yoshi5.png","yoshi6.png","yoshi7.png","yoshi8.png"]
	var	property position = game.at(0,0)
	var property contador = 0
	var property cancion = game.sound("papuParche.mp3")
	
	method ganar(){
		game.removeVisual(mario)
		game.onTick(200,"animacionGanar",{animacionGanar.contar()})
		game.addVisual(animacionGanar)
		game.sound("victory.mp3").play()
		
		game.schedule(8000,{game.clear() self.cargar()})
	}
	method cargar(){
		game.addVisual(self)
		cancion.play()
		game.schedule(16000,{
			game.clear() 
			home.cargar()
		})
		game.onTick(250,"animacionGanar",{self.contar()})
		//game.addVisual(continue) 
	}
	method contar(){
		if(contador<8) {image = imagenes.get(contador) contador+=1}
		else contador=0 
	}
}

object animacionGanar{
	var property position = game.at(10,18)
	var property image = "mariobananita1.png"
	const property imagenes = ["mariobananita1.png","mariobananita2.png","mariobananita3.png","mariobananita4.png","mariobananita5.png","mariobananita6.png","mariobananita7.png","mariobananita8.png"]
	var property contador = 0
	
	method esEscalera() = false
	method contar(){
		if(contador<8) {image = imagenes.get(contador) contador+=1}
		else contador=0 
	}
}

object continue{
	var property position = game.at(0,0)
	var property image = "continue.png"
}