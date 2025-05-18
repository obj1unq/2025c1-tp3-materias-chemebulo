import inscripcionAMaterias.*
import alumno.*
import carreras.*

class Materia {
    const property requisitos = []
    const alumnos = []
    var property cupo = 20

    method tieneCupo() {
        return cupo > 0
    }
}

// ####################################### MATERIAS DE PROGRAMACIÓN ########################################

object elementosDeProgramacion inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object matematicaI inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object basesDeDatos inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object objetosI inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
} 

object objetosII inherits Materia {
    override method requisitos() =  [objetosI, matematicaI]

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object objetosIII inherits Materia {
    override method requisitos() = [objetosII, basesDeDatos]

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object programacionConcurrente inherits Materia {
    override method requisitos() = [objetosI, basesDeDatos]

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object trabajoFinal inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

// ######################################### MATERIAS DE MEDICINA ##########################################

object quimica inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object anatomiaGeneral inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object biologiaI inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object biologiaII inherits Materia {
    override method requisitos() = [biologiaI]

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

// ########################################## MATERIAS DE DERECHO ##########################################

object latin inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object derechoRomano inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
} 

object historiaDeDerechoArgentino inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}

object derechoPenalI inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
} 

object derechoPenalII inherits Materia {
    override method requisitos() = []

    method alumnos() = alumnos

    method inscribir(alumno) {
        alumnos.add(alumno)
    }
}