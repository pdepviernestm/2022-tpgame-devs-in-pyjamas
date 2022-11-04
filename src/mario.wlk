import wollok.game.*
import consultas.*
import niveles.*
import barril.*

object mario{
	var property position = game.at(5,5)
  	const property image = "mario.png"
  	var property vida = 5
    method bajar(){
    	if(consulta.existeEscaleraAbajo(self)) position = position.down(1)
    }
    method subir(){
    	if(consulta.existeEscaleraArriba(self)) position = position.up(1)
    }
    method saltar(){
    	if(!consulta.existeEscaleraArriba(self) && consulta.existePlataforma(self)) {
    		game.removeTickEvent("gravedad")
    		position = position.up(1)
    		game.schedule(250, {position = position.down(1) game.onTick(500,"gravedad",{self.gravedad()})})
    		//game.onTick(500,"gravedad",{self.gravedad()})
    	}
    }
    method derecha(){
    	if (!consulta.existePlataformaDer(self)) position = position.right(1)
    }
    method izquierda(){
    	if (!consulta.existePlataformaIzq(self)) position = position.left(1)
    }
    method danio(n){
    	vida = (vida - n).max(0)
    	if(vida==0) game.say(self,"mamma mia")
    	interfaz.corazones().get(vida).vaciar()
    }
    method puedePisarse() = false
	method esEscalera() = false
	method esBarril() = false
	method gravedad(){
		if (!consulta.existePlataforma(self)) position = position.down(1)
	}
	method colision(){
		if(consulta.existeBarril(self)){
			game.getObjectsIn(position).filter{obj=>obj.esBarril()}.forEach{b=>b.efecto()}
			game.removeTickEvent("colision")
			game.schedule(500,{game.onTick(500,"colision",{self.colision()})})
		} 
	}
	method recuperar(){
		interfaz.corazones().get(vida).llenar()
		vida = (vida+1).min(5)
	}
}