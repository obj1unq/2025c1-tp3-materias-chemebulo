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
        // INSCRIBIRLO
    }

    method puedeInscribirseA(materia, alumno) {
        return self.estaEnMateriasDeCarrerasInscriptas(materia, alumno)
               and not self.aprobo(materia, alumno)
               and not self.seInscribioAMateria(materia, alumno)
               and self.tieneAprobadasLosRequisitoDe(materia, alumno)
               and materia.tieneCupo()
    }

    method seInscribioAMateria(materia, alumno) = alumno.materiasInscriptas().contains(materia)

    method tieneAprobadasLosRequisitoDe(materia, alumno) {
        return materia.requisitos().all({materiaRequisito => self.aprobo(materiaRequisito, alumno)})
    }

    // ###################################### INSCRIPCIÓN - CARRERAS #######################################

    method inscribirACarrera(carrera, alumno) {
        alumno.carrerasInscriptas().add(carrera)
    }

    method seInscribioACarrera(carrera, alumno) = alumno.carrerasInscriptas().contains(carrera)

    method estaEnMateriasDeCarrerasInscriptas(materia, alumno) = self.materiasDeCarrerasInscriptas(alumno).contains(materia)

    method materiasDeCarrerasInscriptas(alumno) = self.materiasDeInscriptas(alumno).flatten()

    method materiasDeInscriptas(alumno) {
        const carrerasInscriptas = alumno.carrerasInscriptas().copy()
        // Mi idea fue no usar directamente la referencia de carrerasInscriptas porque sino me iba a modificar
        // el contenido (lo cual entiendo que está mal en este contexto), y lo que se me ocurrió fue usar una copia.
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