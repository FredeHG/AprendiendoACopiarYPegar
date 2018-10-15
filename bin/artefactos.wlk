import efectosGlobales.*
import refuerzos.*

class Arma {	
	method unidadesDeLucha(duenio) = 3
	method monedas(duenio) = 5 * self.unidadesDeLucha(duenio)
}

object collarDivino {
	var property perlas = 5
	method unidadesDeLucha(duenio) = perlas
	method monedas(duenio) = 2 * perlas
}

class MascaraOscura {
	const indiceDeOscuridad
	var property valorMinimo = 4
	constructor(indiceDeOscuridadInt){
		indiceDeOscuridad = indiceDeOscuridadInt
	}
	
	method unidadesDeLucha(duenio) = valorMinimo.max((fuerzaOscura.valor()/2)*indiceDeOscuridad)
	method monedas(duenio) = 5 * self.unidadesDeLucha(duenio) //No se especifica el preico, lo tratamos como arma
}

class Armadura{
	var property refuerzo
	const valorBaseArmadura
	constructor(refuerzoIni,valorBaseArmaduraIni){
		refuerzo = refuerzoIni
		valorBaseArmadura = valorBaseArmaduraIni
	}
	
	method unidadesDeLucha(duenio) = valorBaseArmadura + refuerzo.valor(duenio)
	method monedas(duenio) = refuerzo.monedas(valorBaseArmadura)
}

object espejoFantastico{	
	method unidadesDeLucha(duenio){
		if(duenio.artefactos().size() <= 1){
			return 0
		}else{
			return duenio.mejorArtefacto().unidadesDeLucha(duenio)
		} 
	}
	method monedas(duenio) = 90
}
// Es indistinto que sean unicos los espejos ya que al solo tener metodos y no atributos, no es necesaria la existencia de uno nuevo por cada personaje que posea uno

// 