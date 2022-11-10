import wollok.game.*

class Corazon{
	const property position
  	var property image = "corLleno.png"
	method vaciar(){
		if(image == "corLleno.png") image = "corVacio.png"
	}
	method llenar(){
		if(image == "corVacio.png") image = "corLleno.png"
	}
}

const corazon1 = new Corazon(position = game.at(14,18))
const corazon2 = new Corazon(position = game.at(15,18))
const corazon3 = new Corazon(position = game.at(16,18))
const corazon4 = new Corazon(position = game.at(17,18))
const corazon5 = new Corazon(position = game.at(18,18))


//BORRAR ESTO DESPUES:
const corazon6 = new Corazon(position = game.at(1,1))
const corazon7 = new Corazon(position = game.at(8,1))