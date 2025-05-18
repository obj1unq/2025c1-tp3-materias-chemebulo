import inscripcionAMaterias.*
import alumno.*
import carreras.*

class Materia {
    const property correlativas = []
    const property alumnosConfirmados = []
    const property listaDeEspera = []
    var property cupo = 20
    var property año = 1
    var property creditos = 15
 
    method tieneCupo() = cupo > 0

    method inscribirSiHayCupo(alumno) {
        if(self.tieneCupo()) { self.inscribir(alumno) } else 
                             { self.añadirALaListaDeEspera(alumno) }
    }

    method inscribir(alumno) {
        alumnosConfirmados.add(alumno)
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
        return !listaDeEspera.isEmpty()
    }

    method confirmarUnAlumnoDeListaDeEspera() {
        const alumnoDeListaDeEspera = listaDeEspera.head()
        listaDeEspera.remove(alumnoDeListaDeEspera)
        self.inscribir(alumnoDeListaDeEspera)
    }

    method cumpleElRequisitoParaInscribirse(alumno) {
        return true
    }
}

// ####################################### MATERIAS DE PROGRAMACIÓN ########################################

object elementosDeProgramacion inherits Materia {}

object matematicaI inherits Materia {}

object basesDeDatos inherits Materia {}

object objetosI inherits Materia {} 

object objetosII inherits Materia {
    override method creditos() = 30
    override method año() = 2

    override method correlativas() = [objetosI, matematicaI]

    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasCorrelativas = self.correlativas()
        return materiasCorrelativas.all({correlativa => sistemaDeInscripcion.aprobo(correlativa, alumno)})
    }
}

object programacionConcurrente inherits Materia {
    override method creditos() = 30
    override method año() = 2

    override method correlativas() = [objetosI, basesDeDatos]

    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasCorrelativas = self.correlativas()
        return materiasCorrelativas.all({correlativa => sistemaDeInscripcion.aprobo(correlativa, alumno)})
    }
}

object objetosIII inherits Materia {
    override method creditos() = 60
    override method año() = 3

    override method correlativas() = [objetosII, basesDeDatos]

    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasCorrelativas = self.correlativas()
        return materiasCorrelativas.all({correlativa => sistemaDeInscripcion.aprobo(correlativa, alumno)})
    }
}

object trabajoFinal inherits Materia {
    override method creditos() = 120
    override method año() = 4

    override method cumpleElRequisitoParaInscribirse(alumno) {
        return alumno.creditos() >= 250
    }
}

// ######################################### MATERIAS DE MEDICINA ##########################################

object quimica inherits Materia {}

object anatomiaGeneral inherits Materia {}

object biologiaI inherits Materia {}

object biologiaII inherits Materia {
    override method creditos() = 30
    override method año() = 2

    override method correlativas() = [biologiaI]

    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasCorrelativas = self.correlativas()
        return materiasCorrelativas.all({correlativa => sistemaDeInscripcion.aprobo(correlativa, alumno)})
    }
}

// ########################################## MATERIAS DE DERECHO ##########################################

object latin inherits Materia {}

object derechoRomano inherits Materia {} 

object historiaDeDerechoArgentino inherits Materia {}

object derechoPenalI inherits Materia {} 

object derechoPenalII inherits Materia {}