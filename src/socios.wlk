import viajes.*

class Socio {
	
	var property actividadesRealizadas = []
	var property limiteActividades
	var property edad
	var property idiomas = []
	
	method adoraElSol() = actividadesRealizadas.all { actividad => actividad.sirveParaBroncearse() }
	
	method actividadesEsforzadas() = actividadesRealizadas.filter { actividad => actividad.esfuerzo() }
	
	method registrar(actividad) {
		if (actividadesRealizadas.size() >= limiteActividades) { self.error("El socio llego al limite de actividades") }
		actividadesRealizadas.add(actividad)
	}
}

class SocioTranquilo inherits Socio {
	
	method meInteresa(actividad) = actividad.dias() >= 4
}

class SocioCoherente inherits Socio {
	
	method meInteresa(actividad) = 
		if (self.adoraElSol()) { actividad.sirveParaBroncearse() }
		else { actividad.esfuerzo() }					
}

class SocioRelajado inherits Socio {
	
	method meInteresa(actividad) = actividad.idiomas().any { idioma => idiomas.contains(idioma) }
}