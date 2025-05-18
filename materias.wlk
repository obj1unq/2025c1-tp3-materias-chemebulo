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
    var property estrategia = ordenDeLlegada
    var property carrera = ninguna
 
    method tieneCupo() = cupo > 0

    method inscribirSiHayCupo(alumno) {
        if(self.tieneCupo()) { self.inscribir(alumno) } else 
                             { self.añadirALaListaDeEspera(alumno) }
    }

    method inscribir(alumno) {
        self.añadirAlumnoAConfirmados(alumno)
        cupo -= 1
    }

    method añadirALaListaDeEspera(alumno) {
        listaDeEspera.add(alumno)
    }

    method darDeBaja(alumno) {
        if(self.hayAlumnosEnListaDeEspera()) {
            self.quitarAlumnoDeConfirmados(alumno)
            estrategia.confirmarUnAlumnoDeListaDeEspera(self)
        } else {
            self.quitarAlumnoDeConfirmados(alumno)
        }
    }

    method añadirAlumnoAConfirmados(alumno) {
        alumnosConfirmados.add(alumno)
    }

    method quitarAlumnoDeConfirmados(alumno) {
        alumnosConfirmados.remove(alumno)
    }


    method hayAlumnosEnListaDeEspera() {
        return !listaDeEspera.isEmpty()
    }

    method cumpleElRequisitoParaInscribirse(alumno) {
        return true
    }
}

// ############################ ESTRATEGIAS PARA ADMINISTRAR LA LISTA DE ESPERA ############################

object ordenDeLlegada {

    method confirmarUnAlumnoDeListaDeEspera(materia) {
        const alumnoDeListaDeEspera = materia.listaDeEspera().head()

        materia.listaDeEspera().remove(alumnoDeListaDeEspera)
        materia.inscribir(alumnoDeListaDeEspera)
    }
}

object elitista {

    method confirmarUnAlumnoDeListaDeEspera(materia) {
        const listaDeEspera = materia.listaDeEspera()
        const mejorPromedio = listaDeEspera.max({alumno => sistemaDeInscripcion.promedio(alumno)})
        
        listaDeEspera.remove(mejorPromedio)
        materia.inscribir(mejorPromedio)
    }
}

object gradoDeAvance {

    method confirmarUnAlumnoDeListaDeEspera(materia) {
        const listaDeEspera = materia.listaDeEspera()
        const carreraDeMateria = materia.carrera()
        const masAvanzado = listaDeEspera.max({alumno => sistemaDeInscripcion.cantidadDeAprobadasEnCarrera(alumno, carreraDeMateria)})
        
        listaDeEspera.remove(masAvanzado)
        materia.inscribir(masAvanzado)
    }
}

// ####################################### MATERIAS DE PROGRAMACIÓN ########################################

object elementosDeProgramacion inherits Materia {
    override method carrera() = programacion
}

object matematicaI inherits Materia {
    override method carrera() = programacion
}

object basesDeDatos inherits Materia {
    override method carrera() = programacion
}

object objetosI inherits Materia {
    override method carrera() = programacion
} 

object objetosII inherits Materia {
    override method carrera() = programacion
    override method creditos() = 30
    override method año() = 2

    override method correlativas() = [objetosI, matematicaI]

    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasDelAñoPasado = sistemaDeInscripcion.materiasDelAñoEn(1, carrera)

        return materiasDelAñoPasado.all({materia => sistemaDeInscripcion.aprobo(materia, alumno)})
    }
}

object programacionConcurrente inherits Materia {
    override method carrera() = programacion
    override method creditos() = 30
    override method año() = 2

    override method correlativas() = [objetosI, basesDeDatos]

    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasDelAñoPasado = sistemaDeInscripcion.materiasDelAñoEn(1, carrera)

        return materiasDelAñoPasado.all({materia => sistemaDeInscripcion.aprobo(materia, alumno)})
    }
}

object objetosIII inherits Materia {
    override method carrera() = programacion
    override method creditos() = 60
    override method año() = 3

    override method correlativas() = [objetosII, basesDeDatos]

    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasDelAñoPasado = sistemaDeInscripcion.materiasDelAñoEn(2, carrera)

        return materiasDelAñoPasado.all({materia => sistemaDeInscripcion.aprobo(materia, alumno)})
    }
}

object trabajoFinal inherits Materia {
    override method carrera() = programacion
    override method creditos() = 120
    override method año() = 4

    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasDelAñoPasado = sistemaDeInscripcion.materiasDelAñoEn(1, carrera)
        const aproboLasDelAñoPasado = materiasDelAñoPasado.all({materia => sistemaDeInscripcion.aprobo(materia, alumno)})

        return alumno.creditos() >= 250 && aproboLasDelAñoPasado
    }
}

// ######################################### MATERIAS DE MEDICINA ##########################################

object quimica inherits Materia {
    override method carrera() = medicina
}

object anatomiaGeneral inherits Materia {
    override method carrera() = medicina
}

object biologiaI inherits Materia {
    override method carrera() = medicina
}

object biologiaII inherits Materia {
    override method carrera() = medicina
    override method creditos() = 30
    override method año() = 2

    override method correlativas() = [biologiaI]

    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasDelAñoPasado = sistemaDeInscripcion.materiasDelAñoEn(1, carrera)

        return materiasDelAñoPasado.all({materia => sistemaDeInscripcion.aprobo(materia, alumno)})
    }
}

// ########################################## MATERIAS DE DERECHO ##########################################

object latin inherits Materia {
    override method carrera() = derecho
}

object derechoRomano inherits Materia {
    override method carrera() = derecho
} 

object historiaDeDerechoArgentino inherits Materia {
    override method carrera() = derecho
}

object derechoPenalI inherits Materia {
    override method carrera() = derecho
    override method creditos() = 30
    override method año() = 2
    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasDelAñoPasado = sistemaDeInscripcion.materiasDelAñoEn(1, carrera)

        return materiasDelAñoPasado.all({materia => sistemaDeInscripcion.aprobo(materia, alumno)})
    }
} 

object derechoPenalII inherits Materia {
    override method carrera() = derecho
    override method creditos() = 60
    override method año() = 3
    override method cumpleElRequisitoParaInscribirse(alumno) {
        const materiasDelAñoPasado = sistemaDeInscripcion.materiasDelAñoEn(2, carrera)

        return materiasDelAñoPasado.all({materia => sistemaDeInscripcion.aprobo(materia, alumno)})
    }
}