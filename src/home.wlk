import wollok.game.*
import nivel1.*

object home {
	var property image= "start.png"
	var property imagenes=["start.png","howtoplay.png","credits.png","exit.png"]
	const property position= game.at(0,0)
	var property cancion = game.sound("A_Secret_Course.mp3")
	
	method cargar(){
		game.addVisual(self)
		game.addVisual(cursor)
		game.addVisual(dkhome)
		game.addVisual(fuegoInicio)
		
		dkhome.animacion()
		fuegoInicio.animacion()
		
		keyboard.up().onPressDo{cursor.subir()}
		keyboard.down().onPressDo{cursor.bajar()}
		keyboard.enter().onPressDo{cursor.seleccionar()}
		
		game.schedule(1,{cancion.play()})
	}
	
	method detener(){
		game.clear()
		//parar sonidos
	}
}

object cursor{
	var property posImagen=0
	var property position= game.at(4,7)
	const property image= "cursor.png"
	
	method subir(){
		if (self.position().y()<7) {position=position.up(2) posImagen=posImagen-1 home.image(home.imagenes().get(posImagen))}
	}
	method bajar(){
		if (self.position().y()>1) {position=position.down(2) posImagen=posImagen+1 home.image(home.imagenes().get(posImagen))}
	}
	
	method seleccionar(){
		if (self.position().y()==7){home.detener() game.schedule(1,{home.cancion().stop()}) nivel1.cargar()}
		if (self.position().y()==1){game.stop()}
	}
}


object dkhome{
	var property image= "dkinicio.png"
	const property position= game.at(0,0)
	
	method animacion(){
		
		game.onTick(6000,"animaciondk",{ 
			
		image="dkinicioder.png"
		game.schedule(1000,{image="dkinicioizq.png"})
		game.schedule(2000,{image="dkinicioder.png"})
		game.schedule(3000,{image="dkinicio.png"})
		
		})			
	}
}
object fuegoInicio{
	var property image="fueguito1.png"
	const property position= game.at(0,0)
	
	method animacion(){
		game.onTick(500,"",{if (image=="fueguito1.png") image="fueguito2.png" else image="fueguito1.png"})
	}
}