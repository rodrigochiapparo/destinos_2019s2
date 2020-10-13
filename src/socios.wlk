class Socios {
	
	var property actividadesQueRealizo = []
	var property maximoActividades 
	var property registroActividad
	
	var property edad 
	var property idiomasQueHabla = []
	var property tipoDeSocio 
	
	method esAdoradorDelSol() { return actividadesQueRealizo.all({ act => act.sirveParaBroncearse()})}
	method actividadesEsforzadas() { return actividadesQueRealizo.filter({ act => act.implicaEsfuerzo()})}
	method registrarActividad() { 
		
		return if (registroActividad > maximoActividades) { "error"} else {registroActividad = registroActividad + 1}
		
	} 
	
	method leAtrae(actividad) { if (tipoDeSocio == "tranquilo") { return actividad.cuantosDias() >= 4}
		else if (tipoDeSocio == "coherente" and self.esAdoradorDelSol()) { return actividad.sirveParaBroncearse()} 
		else if (tipoDeSocio == "coherente" and  not self.esAdoradorDelSol()) { return actividad.implicaEsfuerzo()}
		else { return idiomasQueHabla.contains(actividad) }
	}
	
}
