import wollok.game.*
import nivel1.*

object nip{
	var property image = "fondo.jpg"
	var property nips = ["fondo.jpg","nip30.png","nip60.png","nip80.png","nipfinal.png"]
	var property rojas = ["bombaluz.png","bombaluz2.png"]
	var property oscuras = ["bomba6p.png","bomba16.png"]
	var property continue = ["pressany.png","pressany2.png"]
	var property position = game.at(0,0)
}

object intro{
	var property contador = 0
	var property contador2 = 0
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
		if (contador == 1) contador = 0 else contador = 1
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