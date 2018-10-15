import spells.*

class CotaDeMallas {
	const unidadesDeLucha 
	constructor(unidadesDeLuchaIni){
		unidadesDeLucha = unidadesDeLuchaIni
	}
	
	method valor(duenio) = unidadesDeLucha
	method monedas(valorBaseArmadura) = unidadesDeLucha / 2 
}

object bendicion {
	method valor(duenio) = duenio.nivelDeHechiceria()
	method monedas(valorBaseArmadura) = valorBaseArmadura
}

class Hechizo{
	var property spell
	constructor (spellInicial){
		spell = spellInicial
	}
	method valor(duenio) = spell.poder()
	method monedas(valorBaseArmadura) = valorBaseArmadura + spell.monedas()
}
object ninguno{
	method valor(duenio) = 0
	method monedas(valorBaseArmadura) = 2
}