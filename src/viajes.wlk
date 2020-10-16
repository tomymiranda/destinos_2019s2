class Viaje {

	var property idiomasQueSeUtilizan = []

	method esInteresante() {
		return idiomasQueSeUtilizan.size() > 1
	}

	method esRecomendableParaElSocio(socio){
		return self.esInteresante() && socio.leAtraeActividad(self) && not socio.realizoActividad(self)
	}

}

class ViajeDePlaya inherits Viaje {

	// al menos que pase algo raro no cambia el largo de una playa por eso use const enb vez de var
	const property largoDePlaya

	method implicaEsfuerzo() {
		return self.largoDePlaya() > 1200
	}

	method sirveParaBroncearse() {
		return true
	}

	method diasQueImplicaLaActividad() {
		return self.largoDePlaya() / 500
	}

}

class ExcursionACiudad inherits Viaje {

	var property cantidadDeAtracciones

	method implicaEsfuerzo() {
		return self.cantidadDeAtracciones().between(5, 8)
	}

	method sirveParaBroncearse() {
		return false
	}

	method diasQueImplicaLaActividad() {
		return self.cantidadDeAtracciones() / 2
	}

	override method esInteresante() {
		return super() || self.cantidadDeAtracciones() == 5
	}

}

class ExcursionACiudadTropical inherits ExcursionACiudad {

	override method sirveParaBroncearse() {
		return true
	}

	override method diasQueImplicaLaActividad() {
		return super() + 1
	}

}

class SalidaDeTrekking inherits Viaje {

	var property diasDeSolAlAnio
	var property kilometrosDeSendero

	method implicaEsfuerzo() {
		return self.kilometrosDeSendero() > 80
	}

	method sirveParaBroncearse() {
		return self.diasDeSolAlAnio() > 200 || self.diasDeSolAlAnio().between(100, 200) && self.kilometrosDeSendero() > 120
	}

	method diasQueImplicaLaActividad() {
		return self.kilometrosDeSendero() / 50
	}

	override method esInteresante() {
		return super() && self.diasDeSolAlAnio() > 140
	}

}


// aca duda si es necesario que herede ya que no se utiliza el metodo esInteresante() y la lista de idiomas es fija
class ClaseDeGimnasia inherits Viaje {
	
	method implicaEsfuerzo() {
		return true
	}

	method sirveParaBroncearse() {
		return false
	}

	method diasQueImplicaLaActividad() {
		return 1
	}

	override method esRecomendableParaElSocio(socio){
		return socio.edad().between(20,30)
	}
}

