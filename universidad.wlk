import carreras.*
import materias.*
import alumno.*

object universidad {
    const property carrerasDisponibles = [programacion, medicina, derecho]

    method aprobar(materia, nota, alumno){
        const nuevaCursada = new Cursada(materia = materia, nota = nota)
        alumno.agregarNuevaCursada(nuevaCursada)
    }

    method inscribirAMateria(materia, alumno) {
        materia.inscribirALaMateria(alumno)
    }

    method inscribirACarrera(carrera, alumno) {
        alumno.inscribirACarrera(carrera)
    }

    method darDeBajaEnMateria(materia, alumno) {
        materia.darDeBaja(alumno)
    }

    method carreraDeMateria(materia) {
        return carrerasDisponibles.find({carrera => carrera.tieneLaMateria(materia)})
    }
}