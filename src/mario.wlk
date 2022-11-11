import wollok.game.*
import consultas.*
import DK.*
import interfaz.*
import nivel1.*
import direcciones.*
import gameOver.*

object mario{
	var property position = game.at(5,5)
  	var property image = "marioder.png"
  	var property vida = 5
  	var property invertido = 0
  	var property invencible = false
  	var property stun = false
  	var property direccion = derecha
    method bajar(){
    	if(consulta.existeEscaleraAbajo(self)){
    		position = position.down(1)
    		if(image == "marioescalerader.png") image = "marioescaleraizq.png"
    		else image = "marioescalerader.png"
    	} 
    }
    method subir(){
    	if(consulta.existeEscaleraArriba(self)){
    		position = position.up(1)
    		if(!consulta.existeEscaleraArriba(self)) {image="mariotrepando.png" game.schedule(200,{image="marioder.png"})}
    		else{
    			if(image == "marioescalerader.png") image = "marioescaleraizq.png"
    			else image = "marioescalerader.png"
    		}
    	}
    }
    method saltar(){
    	if(!consulta.existeEscaleraArriba(self) && consulta.existePlataforma(self)) {
    		game.removeTickEvent("gravedad")
    		position = position.up(1)
    		game.sound("jump.mp3").play()
    		game.schedule(250, {position = position.down(1) game.onTick(250,"gravedad",{self.gravedad()})})
    		if(image=="marioder.png") {
    			image="mariosaltader.png" 
    		}
    		if(image=="marioizq.png") {
    			image="mariosaltaizq.png" 
    		}
    		game.schedule(250, {if(image=="mariosaltader.png") image="marioder.png" if(image=="mariosaltaizq.png") image="marioizq.png"})
    	}
    }
    method derecha(){
    	if (!consulta.existePlataformaDer(self)){
    		position = position.right(1) 
    		if (!consulta.existePlataforma(self)){
    			image="mariosaltader.png"
    		}
    		else image = "marioder.png"
    	}
    }
    method izquierda(){
    	if (!consulta.existePlataformaIzq(self)){
    		position = position.left(1) 
    		if (!consulta.existePlataforma(self)){
    			image="mariosaltaizq.png"
    		}
    		else image = "marioizq.png"
    	}
    }
	method danio(n){
        if(!invencible){
            if(vida!=0){
            vida = (vida - 1).max(0)
            if(vida==0) {game.sound("death.mp3").play() gameOver.cargar()}
            interfaz.corazones().get(vida).vaciar()
            if(vida > 0 && n > 1) self.danio(n-1)
            }
        }
    }
    method puedePisarse() = false
	method esEscalera() = false
	method esBarril() = false
	method gravedad(){
		if (!consulta.existePlataforma(self)) {
			position = position.down(1) 
			if(image=="marioizq.png") image = "mariosaltaizq.png"
    		if(image=="marioder.png") image = "mariosaltader.png"
		}
    	else{
    		if(image=="mariosaltaizq.png") image = "marioizq.png"
    		if(image=="mariosaltader.png") image = "marioder.png"
    		}
	}
	method colision(){
		if(consulta.existeBarril(self)) game.getObjectsIn(position).filter{obj=>obj.esBarril()}.forEach{b=>b.efecto() if(vida>0) b.detener() image="marioGolpeado.png" game.schedule(400,{image="marioder.png"})}
		if(donkeyKong.listaPosiciones().contains(position)) self.danio(5)
	}
	method recuperar(n){
		vida = (vida + 1).min(5)
	    interfaz.corazones().get(vida-1).llenar()
	    if(vida < 5 && n > 1) self.recuperar(n-1)
	}
}