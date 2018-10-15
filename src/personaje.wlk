import efectosGlobales.*
import spells.*
import artefactos.*
import feriaHechiceria.*

class Personaje {
	var property valorBaseLucha = 1
	const valorBaseHechiceria = 3
	var property artefactos
	var property oro = 100
	var property hechizos
	var property hechizoPreferido
	
	constructor (artefactosIni,hechizosIni,hechizoPreferidoIni){
		artefactos = artefactosIni
		hechizos = hechizosIni
		hechizoPreferido = hechizoPreferidoIni
	}
	
	method habilidadLucha() = valorBaseLucha + artefactos.sum({artefacto => artefacto.unidadesDeLucha(self)})

	method nivelDeHechiceria() = valorBaseHechiceria* hechizoPreferido.poder() + fuerzaOscura.valor()
	
	method seCreePoderoso() = hechizoPreferido.esPoderoso()
	
	method luchaMayorHechiceria() = self.habilidadLucha() > self.nivelDeHechiceria()
	
	method mejorArtefacto() = artefactos.filter({artefacto => !artefacto.equals(espejoFantastico)}).max({artefacto => artefacto.unidadesDeLucha(self)})
	
	method estaCargado() = artefactos.size() >= 5
	
	method puedeCostear(valor) = oro > valor
	
	method agregarArtefacto(artefacto){
		artefactos.add(artefacto)
	}
	method removerArtefacto(artefacto){
		artefactos.remove(artefacto)
	}
	method cumplirObjetivo(){
		oro +=10
	}
	
	method pagar(precio){
		oro -= precio
	}
		
	method canjearHechizo(hechizo){
		if(self.puedeCostear(feriaHechiceria.precioDeVenta(self,hechizo))){
			self.pagar(feriaHechiceria.precioDeVenta(self,hechizo))
			hechizoPreferido = hechizo
		}else{
			self.error("El personaje no tiene oro suficiente para canjear el hechizo")
		}
	}
	
	method comprarArtefacto(artefacto){
		if(self.puedeCostear(artefacto.monedas(self))){
			self.pagar(artefacto.monedas(self))
			self.agregarArtefacto(artefacto)
		}else{
			self.error("El personaje no tiene oro suficiente para comprar el artefacto")			
		}
	}
}