import wollok.game.*
import consultas.*
import DK.*
import interfaz.*
import nivel1.*

object mario{
	var property position = game.at(5,5)
  	const property image = "mario.png"
  	var property vida = 5
  	var property invertido = 0
  	var property invencible = false
  	var property stun = false
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
    		game.sound("jump.mp3").play()
    		game.schedule(250, {position = position.down(1) game.onTick(500,"gravedad",{self.gravedad()})})
    	}
    }
    method derecha(){
    	if (!consulta.existePlataformaDer(self)) position = position.right(1)
    }
    method izquierda(){
    	if (!consulta.existePlataformaIzq(self)) position = position.left(1)
    }
	method danio(n){
		if(!invencible){
			vida = (vida - 1).max(0)
	        //if(vida==0) game.sound("death.mp3").play()
	        interfaz.corazones().get(vida).vaciar()
	        if(vida > 0 && n > 1) self.danio(n-1)
		}
    }
    method puedePisarse() = false
	method esEscalera() = false
	method esBarril() = false
	method gravedad(){
		if (!consulta.existePlataforma(self)) position = position.down(1)
	}
	method colision(){
		if(consulta.existeBarril(self)) game.getObjectsIn(position).filter{obj=>obj.esBarril()}.forEach{b=>b.efecto() b.detener()}
		if(donkeyKong.listaPosiciones().contains(position)) self.danio(5)
	}
	method recuperar(){
		interfaz.corazones().get(vida).llenar()
		vida = (vida+1).min(5)
	}
}