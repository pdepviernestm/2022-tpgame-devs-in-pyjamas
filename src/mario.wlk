import wollok.game.*
import consultas.*
import niveles.*
import barril.*
import example.*

object mario{
	var property position = game.at(5,5)
  	const property image = "mario.png"
  	var property vida = 5
  	var property invertido = 0
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
    	vida = (vida - 1).max(0)
        if(vida==0) game.say(self,"mamma mia")
        interfaz.corazones().get(vida).vaciar()
        if(vida > 0 && n >1 ){
            self.danio(n-1 )
       }
    }
    method puedePisarse() = false
	method esEscalera() = false
	method esBarril() = false
	method gravedad(){
		if (!consulta.existePlataforma(self)) position = position.down(1)
	}
	method colision(){
		if(consulta.existeBarril(self)){
//			game.getObjectsIn(position).filter{obj=>obj.esBarril()}.forEach{b=>b.efecto()}
//			game.removeTickEvent("colision")
//			game.schedule(500,{game.onTick(500,"colision",{self.colision()})})
			game.getObjectsIn(position).filter{obj=>obj.esBarril()}.forEach{b=>b.efecto() b.detener()}
			//game.removeTickEvent("colision")
			//game.schedule(25,{game.onTick(500,"colision",{self.colision()})})
		}
		if(donkeyKong.listaPosiciones().contains(position)){
//			game.getObjectsIn(position).filter{obj=>obj.esBarril()}.forEach{b=>b.efecto()}
//			game.removeTickEvent("colision")
//			game.schedule(500,{game.onTick(500,"colision",{self.colision()})})
			
			//game.getObjectsIn(position).filter{obj=>obj.esDK()}.forEach{b=>b.efecto() b.detener()}
			self.danio(5)
			
			//game.removeTickEvent("colision")
			//game.schedule(25,{game.onTick(500,"colision",{self.colision()})})
		}  
	}
	method recuperar(){
		interfaz.corazones().get(vida).llenar()
		vida = (vida+1).min(5)
	}
}