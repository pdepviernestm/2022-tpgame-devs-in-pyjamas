import wollok.game.*
import direcciones.*

object consulta {
	method existePlataforma(obj){
        const posAlLado = abajo.siguiente(obj.position())
        return if(game.getObjectsIn(posAlLado).isEmpty()) false else game.getObjectsIn(posAlLado).all{objeto => objeto.puedePisarse()}
	}
}	

