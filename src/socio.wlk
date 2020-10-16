import viajes.*

class Socio {

	var actividadesRealizadas = []
	const property limiteDeActividades
	const property edad
	var idiomas = []

	method esAdoradorDelSol() {
		return actividadesRealizadas.all({ c => c.sirveParaBroncearse() })
	}

	method actividadesEsforzadas() {
		return actividadesRealizadas.filter({ c => c.implicaEsfuerzo() })
	}

	method registrarActividad(actividad) {
		if (actividadesRealizadas.size() < self.limiteDeActividades()) {
			actividadesRealizadas.add(actividad)
		}
	}

	method realizoActividad(actividad){
		return actividadesRealizadas.contains(actividad)
	}
}

class SocioTranquilo inherits Socio {

	method leAtraeActividad(actividad) {
		return actividad.diasQueImplicaLaActividad() >= 4
	}

}

class SocioCoherente inherits Socio {

	method leAtraeActividad(actividad) {
		if (self.esAdoradorDelSol()) {
			return actividad.sirveParaBroncearse()
		} else {
			return actividad.implicaEsfuerzo()
		}
	}

}

class SocioRelajado inherits Socio {

	method leAtraeActividad(actividad) {
	
		return idiomas.all({idioma => actividad.idiomaQueSeUtilizan().contains(idioma)})
	}

}

