// ################################################ ALUMNO ################################################

class Alumno {
    const materiasAprobadas = #{}

    method aprobar(materia, nota){
        const materiaNueva = new Cursada(materia = materia, nota = nota)

        if(self.materiasAprobadas().contains(materia)) {
            self.error("La materia que está registrada como aprobada.")
        } else {
            materiasAprobadas.add(materiaNueva)
        }
    }

    method materiasAprobadas() = materiasAprobadas.map({cursada => cursada.materia()})

    method nota(materia) {
        const materiaABuscar = materiasAprobadas.find({cursada => cursada.materia() == materia})
        return materiaABuscar.nota()
    }

    method cantidadDeMateriasAprobadas() = materiasAprobadas.size()

    method promedio() = materiasAprobadas.asList().sum({cursada => cursada.nota()}) / materiasAprobadas.size()

    method aprobo(materia) = materiasAprobadas.contains(materia)
}

// ################################################ CURSADA ################################################

class Cursada {
    var property materia
    var property nota
}

// ################################################ MATERIAS ###############################################

class Materia {

}

// ############################################### CARRERAS ################################################

// object programacion {
//     method materias(){
//         return [elementosDeProgramacion, matematicaI, objetosI, objetosII, trabajoFinal, basesDeDatos]
//     }
// }

// object medicina {
//     method materias(){
//         return [quimica, biologiaI, biologiaII, anatomiaGeneral]
//     }
// }

// object derecho {
//     method materias(){
//         return [latin, derechoRomano, historiaDeDerechoArgentino, derechoPenalI, derechoPenalII]
//     }
// }

// ####################################### MATERIAS DE PROGRAMACIÓN ########################################

// const elementosDeProgramacion = new Materia(nombre = "Elementos de Programación")
// const matematicaI  = new Materia(nombre = "Matemática I")
// const objetosI     = new Materia(nombre = "Objetos I")
// const objetosII    = new Materia(nombre = "Objetos II")
// const objetosIII   = new Materia(nombre = "Objetos III")
// const trabajoFinal = new Materia(nombre = "Trabajo Final")
// const basesDeDatos = new Materia(nombre = "Bases de Datos")

// ######################################### MATERIAS DE MEDICINA ##########################################

// const quimica    = new Materia(nombre = "Quimica")
// const biologiaI  = new Materia(nombre = "Biología I")
// const biologiaII = new Materia(nombre = "Biología II")
// const anatomiaGeneral = new Materia(nombre = "Anatomía General")

// ########################################## MATERIAS DE DERECHO ##########################################

// const latin          = new Materia(nombre = "Latin")
// const derechoRomano  = new Materia(nombre = "Derecho Romano")
// const historiaDeDerechoArgentino = new Materia(nombre = "Historia de Derecho Argentino")
// const derechoPenalI  = new Materia(nombre = "Derecho Penal I")
// const derechoPenalII = new Materia(nombre = "Derecho Penal II")

// #########################################################################################################