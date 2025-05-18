import alumno.*
import carreras.*
import materias.*

object sistemaDeInscripcion {
    
    // ###################################### INSCRIPCIÓN - MATERIAS ######################################

    method aprobar(materia, nota, alumno){
        self.validarSiAproboMateria(materia, alumno)

        const nuevaCursada = new Cursada(materia = materia, nota = nota)

        alumno.cursadas().add(nuevaCursada)
    }

    method aprobo(materia, alumno) = self.materiasAprobadasDe(alumno).contains(materia)

    method cantidadDeMateriasAprobadasDe(alumno) = self.materiasAprobadasDe(alumno).size()

    method materiasAprobadasDe(alumno) = alumno.cursadas().map({cursada => cursada.materia()})

    method nota(materia, alumno) {
        self.validarSiNoAproboMateria(materia, alumno)

        const materiaABuscar = alumno.cursadas().find({cursada => cursada.materia() == materia})

        return materiaABuscar.nota()
    }

    method promedio(alumno) = alumno.cursadas().average({cursada => cursada.nota()})

    method inscribirAMateria(materia, alumno) {
        self.validarSiPuedeInscribirseEnMateria(materia, alumno)

        materia.inscribirSiHayCupo(alumno)
    }

    method puedeInscribirseA(materia, alumno) {
        return self.estaEnMateriasDeCarrerasInscriptas(materia, alumno)
               and not self.aprobo(materia, alumno)
               and not self.estaInscriptoEnMateria(materia, alumno)
               and self.cumpleElRequisitoDe(materia, alumno)
    }

    method estaInscriptoEnMateria(materia, alumno) = self.materiasInscriptas(alumno).contains(materia)

    method cumpleElRequisitoDe(materia, alumno) = materia.cumpleElRequisitoParaInscribirse(alumno)

    method darDeBaja(materia, alumno) {
        materia.darDeBaja(alumno)
    }

    method alumnosInscriptosEn(materia) = materia.alumnosConfirmados()

    method alumnosEnEsperaEn(materia) = materia.listaDeEspera()

    method materiasInscriptas(alumno) {
        const todasLasMaterias = self.materiasDeCarrerasInscriptas(alumno)

        return todasLasMaterias.filter({materia => materia.alumnosConfirmados().contains(alumno)})
    }

    method materiasEnEspera(alumno) {
        const todasLasMaterias = self.materiasDeCarrerasInscriptas(alumno)

        return todasLasMaterias.filter({materia => materia.listaDeEspera().contains(alumno)})
    }

    method materiasALaQueSePuedeInscribir(alumno) {
        const todasLasMaterias = self.materiasDeCarrerasInscriptas(alumno)

        return todasLasMaterias.filter({materia => self.puedeInscribirseA(materia, alumno)})
    }

    method cantidadDeAprobadasEnCarrera(alumno, carrera) {
        const materiasDeCarrera = carrera.materias()
        const materiasAprobadasDeCarrera = materiasDeCarrera.filter({materia => self.aprobo(materia, alumno)})

        return materiasAprobadasDeCarrera.size()
    }

    method materiasDelAñoEn(año, carrera) {
        const materiasDeCarrera = carrera.materias()
        return materiasDeCarrera.filter({materia => materia.año() == año})
    }

    // ###################################### INSCRIPCIÓN - CARRERAS #######################################

    method inscribirACarrera(carrera, alumno) {
        alumno.carrerasInscriptas().add(carrera)
    }

    method estaInscriptoEnCarrera(carrera, alumno) = alumno.carrerasInscriptas().contains(carrera)

    method estaEnMateriasDeCarrerasInscriptas(materia, alumno) = self.materiasDeCarrerasInscriptas(alumno).contains(materia)

    method materiasDeCarrerasInscriptas(alumno) = self.materiasCarrerasDe(alumno).flatten()

    method materiasCarrerasDe(alumno) {
        const carrerasInscriptas = alumno.carrerasInscriptas()
        
        return carrerasInscriptas.map({carrera => carrera.materias()})
    } 

    // ########################################### VALIDACIONES ############################################

    method validarSiAproboMateria(materia, alumno) {
        if(self.aprobo(materia, alumno)) {
           self.error("El alumno ya tiene registrada como aprobada la materia dada.")
        }
    }

    method validarSiNoAproboMateria(materia, alumno) {
        if(not self.aprobo(materia, alumno)) {
           self.error("El alumno no tiene registrada como aprobada la materia dada.")
        }
    }

    method validarSiPuedeInscribirseEnMateria(materia, alumno) {
        if(not self.puedeInscribirseA(materia, alumno)) {
            self.error("El alumno no se puede inscribir a esta materia, no cumple con las condiciones.")
        } 
    }
}

// ################################################ CURSADA ################################################

class Cursada {
    var property materia
    var property nota
}