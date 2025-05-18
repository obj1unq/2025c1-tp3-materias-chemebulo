import inscripcionAMaterias.*
import alumno.*
import carreras.*

class Materia {
    const property requisitos = []
    const property alumnosConfirmados = []
    const property listaDeEspera = []
    var property cupo = 20

    method tieneCupo() = cupo > 0

    method inscribirSiHayCupo(alumno) {
        if(self.tieneCupo()) { self.inscribir(alumno) } else 
                             { self.añadirALaListaDeEspera(alumno) }
    }

    method inscribir(alumno) {
        alumnosConfirmados.add(alumno)
        alumno.materiasInscriptas().add(self)
        cupo -= 1
    }

    method añadirALaListaDeEspera(alumno) {
        listaDeEspera.add(alumno)
    }

    method darDeBaja(alumno) {
        if(self.hayAlumnosEnListaDeEspera()) {
            alumnosConfirmados.remove(alumno)
            self.confirmarUnAlumnoDeListaDeEspera()
        } else {
            alumnosConfirmados.remove(alumno)
        }
    }

    method hayAlumnosEnListaDeEspera() {
        return not listaDeEspera.isEmpty()
    }

    method confirmarUnAlumnoDeListaDeEspera() {
        const alumnoDeListaDeEspera = listaDeEspera.first()
        alumnosConfirmados.add(alumnoDeListaDeEspera)
    }
}

// ####################################### MATERIAS DE PROGRAMACIÓN ########################################

object elementosDeProgramacion inherits Materia {}

object matematicaI inherits Materia {}

object basesDeDatos inherits Materia {}

object objetosI inherits Materia {} 

object objetosII inherits Materia {
    override method requisitos() = [objetosI, matematicaI]
}

object objetosIII inherits Materia {
    override method requisitos() = [objetosII, basesDeDatos]
}

object programacionConcurrente inherits Materia {
    override method requisitos() = [objetosI, basesDeDatos]
}

object trabajoFinal inherits Materia {}

// ######################################### MATERIAS DE MEDICINA ##########################################

object quimica inherits Materia {}

object anatomiaGeneral inherits Materia {}

object biologiaI inherits Materia {}

object biologiaII inherits Materia {
    override method requisitos() = [biologiaI]
}

// ########################################## MATERIAS DE DERECHO ##########################################

object latin inherits Materia {}

object derechoRomano inherits Materia {} 

object historiaDeDerechoArgentino inherits Materia {}

object derechoPenalI inherits Materia {} 

object derechoPenalII inherits Materia {}