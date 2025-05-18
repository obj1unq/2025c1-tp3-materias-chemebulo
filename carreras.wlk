import inscripcionAMaterias.*
import alumno.*
import materias.*

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