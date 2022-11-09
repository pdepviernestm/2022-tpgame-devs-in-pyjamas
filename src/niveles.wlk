import wollok.game.*
import plataformas.*
import escalera.*
import barril.*
import example.*
import mario.*

object nivel1{
	const property posPlataformas = []
	const property posEscaleras = []
	method cargar(){
		//Config
	//game.addVisual(bco1)
	//game.addVisual(bn1)
	//game.addVisual(bce1)
	game.onTick(4000,"barriles",{[new BarrilComun(), new BarrilNegro(),new BarrilCeleste(), new BarrilVerde()].get((0..3).anyOne()).iniciar()})
	game.addVisual(corazon1)
	game.addVisual(corazon2)
	game.addVisual(corazon3)
	game.addVisual(corazon4)
	game.addVisual(corazon5)
	game.addVisual(donkeyKong)
  	game.onTick(500,"gravedad",{mario.gravedad()})
  	keyboard.up().onPressDo{mario.subir()}
    keyboard.down().onPressDo{mario.bajar()}
    keyboard.space().onPressDo{mario.saltar()}
    keyboard.right().onPressDo{mario.derecha()}
    keyboard.left().onPressDo{mario.izquierda()}
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
		
		game.addVisual(mario)
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

object interfaz{
	const property corazones = [corazon1,corazon2,corazon3,corazon4,corazon5]
	method dibujar(dibujo){
		game.addVisual(dibujo)
		return dibujo
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method cargar(){
		//(14..18).forEach{n=>posCorazones.add(new Position(x=10,y=n))}
	}
}

class Corazon{
	const property position
  	var property image = "corLleno.png"
	method vaciar(){
		if(image == "corLleno.png") image = "corVacio.png"
	}
	method llenar(){
		if(image == "corVacio.png") image = "corLleno.png"
	}
}


object nip{
	var property image= "fondo.jpg"
	var property nips= ["fondo.jpg","nip30.png","nip60.png","nip80.png","nipfinal.png"]
	var property rojas=["bombaluz.png","bombaluz2.png"]
	var property oscuras= ["bomba6p.png","bomba16.png"]
	var property continue= ["pressany.png","pressany2.png"]
	var property position = game.at(0,0)
}

object intro{
	var property contador=0
	var property contador2=0
	method cargar(){
		
		game.addVisual(nip)
		game.schedule(1500,{nip.image(nip.oscuras().get(0))})
		game.schedule(3500,{nip.image(nip.oscuras().get(1))})
		game.schedule(5000,{game.sound("intro completa.mp3").play()})
		game.schedule(5000,{self.parpadear()})
		game.schedule(17000,{game.removeTickEvent("parpadeoRojo")})
		game.schedule(17000,{nip.image("bombaBrillo2.png")})
		game.schedule(18000,{nip.image("bombaBrillo.png")})
		game.schedule(18600,{self.logo()})
		game.schedule(21000,{game.removeTickEvent("logo") self.continue()} )
		
	}
	
	method saltar(){
		game.clear()		
		nivel1.cargar()
	}
	
	method parpadear(){
		game.onTick(250,"parpadeoRojo",{nip.image(nip.rojas().get(contador)) self.contador()})
	}
	
	method contador(){
	if (contador==1) contador=0 else contador =1
	return contador
	}
	
	method logo(){
		game.onTick(400,"logo",{nip.image(nip.nips().get(contador2))  contador2=contador2+1})
	}
	
	method continue(){
		game.onTick(400,"continue",{nip.image(nip.continue().get(contador)) self.contador()})
		keyboard.any().onPressDo{self.saltar()}
	}
}

const corazon1 = new Corazon(position = game.at(14,18))
const corazon2 = new Corazon(position = game.at(15,18))
const corazon3 = new Corazon(position = game.at(16,18))
const corazon4 = new Corazon(position = game.at(17,18))
const corazon5 = new Corazon(position = game.at(18,18))