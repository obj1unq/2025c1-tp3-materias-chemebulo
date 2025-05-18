class Alumno {
    // ######################################## ALUMNO - ATRIBUTOS #########################################

    const cursadas = [] // La idea de cursadas es que almacene las materias que ya cursó y aprobó el Alumno, se que puede llegar a causar confusión el nombre pero no se me ocurrió uno mejor.
    const carrerasInscriptas = []
    const materiasInscriptas = []

    // ######################################### ALUMNO - MATERIAS #########################################

    method aprobar(materia, nota){
        self.validarSiAproboMateria(materia)
        const nuevaCursada = new Cursada(materia = materia, nota = nota)
        cursadas.add(nuevaCursada)
    }

    method materiasAprobadas() = cursadas.map({cursada => cursada.materia()})

    method cantidadDeMateriasAprobadas() = self.materiasAprobadas().size()

    method aprobo(materia) = self.materiasAprobadas().contains(materia)

    method nota(materia) {
        self.validarSiNoAproboMateria(materia)
        const materiaABuscar = cursadas.find({cursada => cursada.materia() == materia})
        return materiaABuscar.nota()
    }

    method promedio() = cursadas.average({cursada => cursada.nota()})

    method inscribirAMateria(materia) {
        self.validarSiPuedeInscribirseEnMateria(materia)
        // INSCRIBIRLO
    }

    method puedeInscribirseA(materia) {
        return self.estaEnMateriasDeCarrerasInscriptas(materia)
               and not self.aprobo(materia)
               and not self.seInscribioAMateria(materia)
               and self.tieneAprobadasLosRequisitoDe(materia)
               and materia.tieneCupo()
    }

    method seInscribioAMateria(materia) = materiasInscriptas.contains(materia)

    method tieneAprobadasLosRequisitoDe(materia) {
        const requisitosDeLaMateria = materia.requisitos()

        return requisitosDeLaMateria.all({materiaRequisito => self.aprobo(materiaRequisito)})
    } // REVISAR

    // ######################################### ALUMNO - CARRERAS #########################################

    method inscribirACarrera(carrera) {
        carrerasInscriptas.add(carrera)
    }

    method seInscribioACarrera(carrera) = carrerasInscriptas.contains(carrera)

    method estaEnMateriasDeCarrerasInscriptas(materia) = self.materiasDeCarrerasInscriptas().contains(materia)

    method materiasDeCarrerasInscriptas() = self.materiasDeInscriptas().flatten()

    method materiasDeInscriptas() = carrerasInscriptas.map({carrera => carrera.materias()})

    // ####################################### ALUMNO - VALIDACIONES #######################################

    method validarSiAproboMateria(materia) {
        if(self.aprobo(materia)) {
           self.error("La materia ya se encuentra registrada como aprobada.")
        }
    }

    method validarSiNoAproboMateria(materia) {
        if(not self.aprobo(materia)) {
           self.error("La materia no se encuentra registrada como aprobada.")
        }
    }

    method validarSiPuedeInscribirseEnMateria(materia) {
        if(not self.puedeInscribirseA(materia)) {
            self.error("No se puede inscribir a esta materia, no se cumplen las condiciones.")
        } 
    }
}

// ################################################ CURSADA ################################################

class Cursada {
    var property materia
    var property nota
}

// ############################################### CARRERAS ################################################

class Carrera {
    var property materias = []
}

object programacion inherits Carrera {
    override method materias(){
        return [elementosDeProgramacion, matematicaI, basesDeDatos, objetosI, objetosII, programacionConcurrente, trabajoFinal]
    }
}

object medicina inherits Carrera {
    override method materias(){
        return [quimica, anatomiaGeneral, biologiaI, biologiaII]
    }
}

object derecho inherits Carrera {
    override method materias(){
        return [latin, derechoRomano, historiaDeDerechoArgentino, derechoPenalI, derechoPenalII]
    }
}

// ################################################ MATERIAS ###############################################

class Materia {
    var property requisitos = []
    var alumnos = []
    var property cupo = 20
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

// #########################################################################################################