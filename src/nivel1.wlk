import wollok.game.*
import plataformas.*
import escaleras.*
import barriles.*
import DK.*
import mario.*
import corazones.*
import powerups.*

object nivel1{
	const property posPlataformas = []
	const property posEscaleras = []
	const property posPowerups = []
	var property contadorBarriles = 0
	
	method cargar(){
		//Config
		game.onTick(4000,"barriles",{[new BarrilComun(), new BarrilNegro(),new BarrilCeleste(), new BarrilVerde()].get((0..3).anyOne()).iniciar() contadorBarriles += 1})
		//game.onTick(10000,"powerups",{[new Estrella(),new Mate()].get((0..1).anyOne()).game.addVisual(self)})
		//game.onTick(25,"colision",{mario.colision()})
		
		game.addVisual(corazon6)
		game.addVisual(corazon7)
		
		game.addVisual(corazon1)
		game.addVisual(corazon2)
		game.addVisual(corazon3)
		game.addVisual(corazon4)
		game.addVisual(corazon5)
		game.addVisual(donkeyKong)
	  	game.onTick(500,"gravedad",{mario.gravedad()})
	  	keyboard.up().onPressDo{if(mario.invertido() == 0) mario.subir() else mario.bajar()}
	    keyboard.down().onPressDo{ if(mario.invertido() == 0) mario.bajar() else mario.subir()}
	    keyboard.space().onPressDo{if (!mario.stun()) mario.saltar()}
	    keyboard.right().onPressDo{if(mario.invertido() == 0) mario.derecha() else mario.izquierda()}
	    keyboard.left().onPressDo{if(mario.invertido() == 0) mario.izquierda() else mario.derecha()}
		keyboard.r().onPressDo{mario.recuperar()}
		donkeyKong.agregarPosicion()
		

		//Plataformas
		(1..18).forEach{n=>posPlataformas.add(new Position(x=n,y=0))}
		(1..17).forEach{n=>posPlataformas.add(new Position(x=n,y=3))}
		(2..18).forEach{n=>posPlataformas.add(new Position(x=n,y=6))}
		(1..17).forEach{n=>posPlataformas.add(new Position(x=n,y=9))}
		(2..18).forEach{n=>posPlataformas.add(new Position(x=n,y=12))}
		(1..17).forEach{n=>posPlataformas.add(new Position(x=n,y=15))}
		(8..12).forEach{n=>posPlataformas.add(new Position(x=n,y=17))}
		posPlataformas.forEach{p => self.dibujar(new Plataforma(position = p))}
		//Escaleras
		(1..3).forEach{n=>posEscaleras.add(new Position(x=17,y=n))}
		(4..6).forEach{n=>posEscaleras.add(new Position(x=5,y=n))}
		(7..9).forEach{n=>posEscaleras.add(new Position(x=2,y=n))}
		(10..12).forEach{n=>posEscaleras.add(new Position(x=17,y=n))}
		(13..15).forEach{n=>posEscaleras.add(new Position(x=13,y=n))}
		(16..17).forEach{n=>posEscaleras.add(new Position(x=10,y=n))}
		posEscaleras.forEach{p => self.dibujar(new Escalera(position = p))}
		//Powerups
		(1..18).forEach{n=>posPowerups.add(new Position(x=n,y=1))}
		(1..17).forEach{n=>posPowerups.add(new Position(x=n,y=4))}
		(2..18).forEach{n=>posPowerups.add(new Position(x=n,y=7))}
		(1..17).forEach{n=>posPowerups.add(new Position(x=n,y=10))}
		(2..18).forEach{n=>posPowerups.add(new Position(x=n,y=13))}
		(1..17).forEach{n=>posPowerups.add(new Position(x=n,y=16))}
		(8..12).forEach{n=>posPowerups.add(new Position(x=n,y=18))}
		posPowerups.forEach{p => self.dibujar(new Powerup(position = p))}
		
		game.addVisual(mario)
		game.whenCollideDo(mario,{b => if(b.esBarril()) mario.colision()})
//		self.dibujar(estrella) 
//		estrella.iniciar()
//		estrella.position(game.at(6,1))		
		}
		method dibujar(dibujo) {
			game.addVisual(dibujo)
			return dibujo
		}
		method restart() {
			game.clear()
			self.cargar()
		}
}