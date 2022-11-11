import wollok.game.*
import plataformas.*
import escaleras.*
import barriles.*
import DK.*
import mario.*
import powerups.*
import interfaz.*
import peach.*

object nivel1{
	const property posPlataformas = []
	const property posEscaleras = []
	const property posPowerups = []
	var property contadorBarriles = 0
	
	method cargar(){
		//Config
		game.onTick(6000,"barriles",{[new BarrilComun(), new BarrilNegro(),new BarrilCeleste(), new BarrilVerde()].get((0..3).anyOne()).iniciar() contadorBarriles += 1})
		game.onTick(10000,"powerups",{[new Estrella(position = self.posRandom()),new Mate(position = self.posRandom()),new HonguitoRojo(position = self.posRandom()),new HonguitoVerde(position = self.posRandom())].get((0..3).anyOne()).iniciar()})
		
		interfaz.cargar()
		game.addVisual(donkeyKong)
	  	game.onTick(250,"gravedad",{mario.gravedad()})
	  	keyboard.up().onPressDo{if(mario.invertido() == 0) mario.subir() else mario.bajar()}
	    keyboard.down().onPressDo{ if(mario.invertido() == 0) mario.bajar() else mario.subir()}
	    keyboard.space().onPressDo{if (!mario.stun()) mario.saltar()}
	    keyboard.right().onPressDo{if(mario.invertido() == 0) mario.derecha() else mario.izquierda()}
	    keyboard.left().onPressDo{if(mario.invertido() == 0) mario.izquierda() else mario.derecha()}
		keyboard.r().onPressDo{mario.recuperar(1)}
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
		(1..18).forEach{n=>posPowerups.add(new Position(x=n,y=2))}
		(1..17).forEach{n=>posPowerups.add(new Position(x=n,y=4))}
		(1..17).forEach{n=>posPowerups.add(new Position(x=n,y=5))}
		(2..18).forEach{n=>posPowerups.add(new Position(x=n,y=7))}
		(2..18).forEach{n=>posPowerups.add(new Position(x=n,y=8))}
		(1..17).forEach{n=>posPowerups.add(new Position(x=n,y=10))}
		(1..17).forEach{n=>posPowerups.add(new Position(x=n,y=11))}
		(2..18).forEach{n=>posPowerups.add(new Position(x=n,y=13))}
		(2..18).forEach{n=>posPowerups.add(new Position(x=n,y=14))}
		
		mario.position(game.at(1,1))
		mario.recuperar(5)
		game.addVisual(mario)
				
		game.addVisual(peach)
		game.whenCollideDo(mario,{b => if(b.esBarril()) mario.colision()})
		game.whenCollideDo(mario,{power => if (power.esPowerUp()) {power.efecto() game.removeVisual(power)} })			
		game.schedule(250,{game.sound("here_we_go.mp3").play()})
			
		}
		method posRandom()= posPowerups.get(0.randomUpTo(posPowerups.size()-1))
		method dibujar(dibujo) {
			game.addVisual(dibujo)
			return dibujo
		}
		method restart() {
			game.clear()
			self.cargar()
		}
}