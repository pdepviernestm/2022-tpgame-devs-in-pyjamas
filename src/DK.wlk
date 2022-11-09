import wollok.game.*

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
}