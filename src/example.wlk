import wollok.game.*
import direcciones.*

object donkeyKong{
	const property position = game.at(3,16)
	var property listaPosiciones = []
  	const property image = "DK200_OK.png"
  	method esDK() = true
	
	method agregarPosicion(){
		listaPosiciones = [position,position.up(1),position.up(1).up(1),position.up(1).up(1).up(1),
        position.right(1), position.right(1).right(1),position.right(1).right(1).right(1),
        position.right(1).right(1).right(1).up(1),position.right(1).right(1).right(1).up(1).up(1),
        position.right(1).right(1).right(1).up(1).up(1).up(1),position.right(1).right(1).up(1).up(1).up(1),position.right(1).up(1).up(1).up(1)]
	}
//		listaPosiciones.addAll([
//			derecha.siguiente(position),
//			derecha.siguiente(derecha.siguiente(position)),
//			derecha.siguiente(derecha.siguiente(derecha.siguiente(position))),
//			arriba.siguiente(position),
//			abajo.siguiente(derecha.siguiente(derecha.siguiente(derecha.siguiente(arriba.siguiente(arriba.siguiente(position)))))),
//			arriba.siguiente(arriba.siguiente(position)),	
//			derecha.siguiente(arriba.siguiente(arriba.siguiente(position))),
//			derecha.siguiente(derecha.siguiente(arriba.siguiente(arriba.siguiente(position)))),
//			derecha.siguiente(derecha.siguiente(derecha.siguiente(arriba.siguiente(arriba.siguiente(position)))))])
	//10 (derecha.siguiente(position))
	//11 derecha.siguiente(derecha.siguiente(position))
	//12 derecha.siguiente(derecha.siguiente(derecha.siguiente(position)))
	
	//5 arriba.siguiente(position) 
	//8 abajo.siguiente(derecha.siguiente(derecha.siguiente(derecha.siguiente(arriba.siguiente(arriba.siguiente(position))))))

	//1 arriba.siguiente(arriba.siguiente(position))	
	//2 derecha.siguiente(arriba.siguiente(arriba.siguiente(position)))
	//3 derecha.siguiente(derecha.siguiente(arriba.siguiente(arriba.siguiente(position))))
	//4 derecha.siguiente(derecha.siguiente(derecha.siguiente(arriba.siguiente(arriba.siguiente(position)))))

//	  	1 2  3  4
//	  	5 6  7  8
//        9 10 11 12


object mate{
	const property position = game.at(5,3)
  	const property image = "mate50.png"
}

