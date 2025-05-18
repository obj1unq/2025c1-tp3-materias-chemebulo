import inscripcionAMaterias.*

class Alumno {
    const cursadas = [] // La idea de cursadas es que almacene las materias que ya cursó y aprobó el Alumno, 
                        // se que puede llegar a causar confusión el nombre pero no se me ocurrió uno mejor.
    const carrerasInscriptas = []

    method cursadas() = cursadas
    method carrerasInscriptas() = carrerasInscriptas
}