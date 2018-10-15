class Logo {
	var property nombre
	var indiceMultiplicador
	
	constructor(nombreIni,indiceMultiplicadorIni){
		nombre = nombreIni
		indiceMultiplicador = indiceMultiplicadorIni
	}
	
	method poder() = nombre.size()*indiceMultiplicador
	method esPoderoso() = self.poder() > 15
	method monedas() = self.poder()
}

object hechizoBasico {
	var property nombre = "hechizoBasico"
	method poder() = 10
	method esPoderoso() = self.poder() > 15
	method monedas() = 10
}

class LibroDeHechizos{
	const hechizos //lista hechizos
	constructor (hechizosIni){
		hechizos = hechizosIni
	}
	
	method poder() = hechizos.filter{hechizo => hechizo.esPoderoso()}.sum({hechizo => hechizo.poder()})
	
	method esPoderoso() = self.poder() > 15
	
	method monedas() = 10 * hechizos.size() + hechizos.filter{hechizo => hechizo.esPoderoso()}.sum{hechizo => hechizo.poder()}
}