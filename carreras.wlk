import materias.*
import universidad.*
import alumno.*

class Carrera {
    const property materias = []

    method cantidadDeAprobadasEnCarrera(alumno) {
        const materiasAprobadas = materias.filter({materia => alumno.aprobo(materia)})
        return materiasAprobadas.size()
    }

    method materiasDelAñoEn(año) {
        return materias.filter({materia => materia.esDelAño(año)})
    }

    method tieneLaMateria(materiaABuscar) = materias.any({materia => materia.nombre() == materiaABuscar.nombre()})
}

const programacion = new Carrera(materias = [elementosDeProgramacion, matematicaI, basesDeDatos, objetosI, objetosII, programacionConcurrente, trabajoFinal])

const medicina = new Carrera(materias = [quimica, anatomiaGeneral, biologiaI, biologiaII])

const derecho = new Carrera(materias = [latin, derechoRomano, historiaDeDerechoArgentino, derechoPenalI, derechoPenalII])