import wollok.game.*
import direcciones.*

object consulta {
	method existePlataforma(obj){
        const posAlLado = abajo.siguiente(obj.position())
        return if(game.getObjectsIn(posAlLado).isEmpty()) false else game.getObjectsIn(posAlLado).any{objeto => objeto.puedePisarse()}
	}
	method existeEscaleraArriba(obj){
        return game.getObjectsIn(obj.position()).any{objeto => objeto.esEscalera()}		
	}
	method existeEscaleraAbajo(obj){
        const posAlLado = abajo.siguiente(obj.position())
        return if(game.getObjectsIn(posAlLado).isEmpty()) false else game.getObjectsIn(posAlLado).any{objeto => objeto.esEscalera()}		
	}
	method existePlataformaDer(obj){
        const posAlLado = derecha.siguiente(obj.position())
        return if(game.getObjectsIn(posAlLado).isEmpty()) false else game.getObjectsIn(posAlLado).any{objeto => objeto.esPlataforma()}
	}
	method existePlataformaIzq(obj){
        const posAlLado = izquierda.siguiente(obj.position())
        return if(game.getObjectsIn(posAlLado).isEmpty()) false else game.getObjectsIn(posAlLado).any{objeto => objeto.esPlataforma()}
	}
	method existeBarril(obj){
        return game.getObjectsIn(obj.position()).any{objeto => objeto.esBarril()}
	}
}	