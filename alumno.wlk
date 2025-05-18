import inscripcionAMaterias.*

class Alumno {
    const property cursadas = [] // La idea de cursadas es que almacene las materias que ya cursó y aprobó el Alumno, 
                        // se que puede llegar a causar confusión el nombre pero no se me ocurrió uno mejor.
    const property carrerasInscriptas = []

    method creditos() {
        const todasLasMaterias = sistemaDeInscripcion.materiasInscriptas(self)
        return todasLasMaterias.sum{materia => materia.credito()}
    }
}