class ViajeDePlaya {
	
	var property largo 
	var property idiomas = []
	
	method cuantosDias(){ return largo / 500}
	method implicaEsfuerzo(){ return largo > 1200}
	method sirveParaBroncearse() { return true }	
	
	method esInteresante() { return idiomas.size() > 1}
	
	method esRecomendadaPara(socio){ return self.esInteresante() and socio.leAtrae(self) and not socio.actividadesQueRealizo().contains(self)}
}

class ExcursionACiudad {
	
	var property atracciones 
	var property idiomas = []
	
	method cuantosDias() { return atracciones / 2}
	method implicaEsfuerzo() { return atracciones.between(5,8)}
	method sirveParaBroncearse() { return false }
	
	method esInteresante() { return idiomas.size() > 1 or atracciones == 5}
	
	method esRecomendadaPara(socio){ return self.esInteresante() and socio.leAtrae(self) and not socio.actividadesQueRealizo().contains(self)}
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	
	override method cuantosDias() {return super () + 1}
	override method sirveParaBroncearse() { return true }
}

class SalidaDeTrekking {
	
	var property idiomas = []
	var property kmDeSenderos 
	var property diasDeSol
	
	method cuantosDias() { return kmDeSenderos / 50 }
	method implicaEsfuerzo() { return kmDeSenderos > 80}
	method sirveParaBroncearse() { return diasDeSol > 200 or (diasDeSol.between(100,200) and kmDeSenderos > 120)}
	
	method esInteresante() { return idiomas.size() > 1 and diasDeSol > 140}
	
	method esRecomendadaPara(socio){ return self.esInteresante() and socio.leAtrae(self) and not socio.actividadesQueRealizo().contains(self)}
	
}

class ClasesDeGimnasia {
	
	const property idiomas = [ "espaniol"]
	
	method cuantosDias() { return 1 }
	method implicaEsfuerzo() { return true}
	method sirveParaBroncearse() { return false }
	
	method esRecomendadaPara(socio) { return socio.edad().between(20,30)}

}

class TallerLiterario {
	
	var property libros = []
	
    var property idiomas = libros.idioma()
    
    method implicaEsfuerzo() {
    	return (libros.any({ l => l.cantidadDePaginas() > 500}) or libros.all({ l => l.nombreDelAutor() == "borges"})) and libros.size() > 1
    }
    
    method sirveParaBroncearse() { return false}
    method esRecomendadoPara(socio) { return socio.idiomasQueHabla().size() > 1 }
}

class Libros {
	
	var property idioma
	var property cantidadDePaginas
	var property nombreDelAutor
}