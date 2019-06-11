import socios.*

class Viaje {
	
	var property idiomas = []
	
	method esInteresante() = idiomas.size() > 1
	
	method esRecomendadaPara(socio) = ((self.esInteresante()) and (socio.leAtrae(self)) and (not socio.actividadesRealizadas().contains(self)))
}

class ViajeAPlaya inherits Viaje {
	
	var largoPlaya
	
	method dias() = largoPlaya / 500
	
	method esfuerzo() = largoPlaya > 1200
	
	method sirveParaBroncearse() = true
}

class ExcurcionACiudad inherits Viaje {
	
	var cantidadAtracciones
	
	method dias() = cantidadAtracciones / 2
	
	method esfuerzo() = cantidadAtracciones.between(5, 8)
	
	method sirveParaBroncearse() = false
	
	override method esInteresante() = (idiomas.size() > 1) or (cantidadAtracciones == 5)
}

class ExcurcionACiudadTropical inherits ExcurcionACiudad {
	
	override method dias() = (cantidadAtracciones / 2) + 1
	
	override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje {
	
	var kmPorSendero
	var diasDeSol
	
	method dias() = kmPorSendero / 50
	
	method esfuerzo() = kmPorSendero > 80
	
	method sirveParaBroncearse() = (diasDeSol > 200) or (diasDeSol.between(100, 200) and kmPorSendero > 120)
	
	override method esInteresante() = (idiomas.size() > 1 and diasDeSol > 140)
}

class ClasesDeGimnasia inherits Viaje {
	
	override method idiomas() = ["Espaniol"]
	
	method dias() = 1
	
	method esfuerzo() = true
	
	method sirveParaBroncearse() = false
	
	override method esRecomendadaPara(socio) = socio.edad().between(20, 30)
}