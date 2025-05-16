object roque {
    
}

object universidad {
    
}

// ############################################### CARRERAS ###############################################

object programacion {
    method materias(){
        return [elementosDeProgramacion, matematicaI, objetosI, objetosII, trabajoFinal, basesDeDatos]
    }
}

object medicina {
    method materias(){
        return [quimica, biologiaI, biologiaII, anatomiaGeneral]
    }
}

object derecho {
    method materias(){
        return [latin, derechoRomano, historiaDeDerechoArgentino, derechoPenalI, derechoPenalII]
    }
}

// ############################################### MATERIAS ###############################################

class Materia {
    var property nombre
}

class MateriaAprobada inherits Materia {
    var property nota
}

// ####################################### MATERIAS DE PROGRAMACIÓN #######################################

const elementosDeProgramacion = new Materia(nombre = "Elementos de Programación")
const matematicaI  = new Materia(nombre = "Matemática I")
const objetosI     = new Materia(nombre = "Objetos I")
const objetosII    = new Materia(nombre = "Objetos II")
const objetosIII   = new Materia(nombre = "Objetos III")
const trabajoFinal = new Materia(nombre = "Trabajo Final")
const basesDeDatos = new Materia(nombre = "Bases de Datos")

// ######################################### MATERIAS DE MEDICINA #########################################

const quimica    = new Materia(nombre = "Quimica")
const biologiaI  = new Materia(nombre = "Biología I")
const biologiaII = new Materia(nombre = "Biología II")
const anatomiaGeneral = new Materia(nombre = "Anatomía General")

// ########################################## MATERIAS DE DERECHO #########################################

const latin          = new Materia(nombre = "Latin")
const derechoRomano  = new Materia(nombre = "Derecho Romano")
const historiaDeDerechoArgentino = new Materia(nombre = "Historia de Derecho Argentino")
const derechoPenalI  = new Materia(nombre = "Derecho Penal I")
const derechoPenalII = new Materia(nombre = "Derecho Penal II")

// ########################################################################################################