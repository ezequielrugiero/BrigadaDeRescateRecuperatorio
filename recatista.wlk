

import sistemaNacional.*
import brigada.*
class Rescatistas {
    var nivelExperiencia = 1
    var mision = asistencia
    var miBrigada = null

    method nivelExperiencia()=nivelExperiencia
    method mision()=mision
    method miBrigada()=miBrigada


    method cambiaraA(unaNuevaMision){
        mision = unaNuevaMision
    }

    method subirExperiencia (unaCantidad){
        nivelExperiencia = nivelExperiencia + unaCantidad
    }

    method operatividad(){
        return nivelExperiencia * 5
    }

    method esEspecialistaEnBusqueda(){
        return self.mision() == busqueda
    }

    method realiseUnaMision(unaBrigada){
        miBrigada = unaBrigada
        mision.veneficicionDeUnaMision(unaBrigada, self)
        self.condicionAdicional()
    }

    method condicionAdicional()

}


class Humanos inherits Rescatistas {
    var capacitaciones = 0

    method capacitaciones()=capacitaciones

    method nuevaCapacitacion (unaCantidad){
        capacitaciones = capacitaciones + unaCantidad
    }

    override method operatividad(){
        return super() + (self.capacitaciones()*5)
    }

    override method condicionAdicional(){
        self.nuevaCapacitacion(1)
    }

    override method esEspecialistaEnBusqueda(){
        return super() and capacitaciones >= 3
    }


}

class Perros inherits Rescatistas {
    var nivelEntrenamiento = 1

    method nivelEntrenamiento()=nivelEntrenamiento

    method entrenarse(unaCantidad){
        nivelEntrenamiento = nivelEntrenamiento + unaCantidad
    }

    override method operatividad(){
        return super() + (nivelEntrenamiento * 3)
    }

    override method esEspecialistaEnBusqueda(){
        return true
    }

      override method condicionAdicional(){
        self.entrenarse(3)
    }

}

class Autonomos inherits Rescatistas {
    var nivelDeEnergia = 100

    method nivelDeEnergia()=nivelDeEnergia

    method consumoDeEnergia(unaCantidad){
        nivelDeEnergia = nivelDeEnergia - unaCantidad
    }

    override method operatividad() {
        return super() + self.nivelDeEnergia()
    }

    method cargaCompleta(){
        nivelDeEnergia = 100
    }
}

class Androides inherits Autonomos {
   
    method esEspecialistaEnAsistencia(){
        return true
    }

    override method esEspecialistaEnBusqueda(){
        return self.nivelDeEnergia() >= 60 
    }

    override method condicionAdicional(){
        self.consumoDeEnergia(20)
    } 

}


class Drones inherits Autonomos{
    const alturaMaximaDeVuelo 

    method alturaMaximaDeVuelo()= alturaMaximaDeVuelo
    
    
    override method operatividad() {
        return super() + (alturaMaximaDeVuelo * 0.25)
    }

    override method condicionAdicional(){
        self.consumoDeEnergia(10)
        self.cambiaraA(reconocimineto)
    }

    override method esEspecialistaEnBusqueda(){
        return false
    } 


}


object busqueda {
    
    method veneficicionDeUnaMision(unaBrigada, unRescatista){
        unRescatista.subirExperiencia(unRescatista.nivelExperiencia() * 1.25)
        unaBrigada.nuevaCapacidadMaxima(2)

    }
  
}

object asistencia {
    method veneficicionDeUnaMision(unaBrigada, unRescatista){
        unRescatista.subirExperiencia(unRescatista.nivelExperiencia() * 1.15)
        unaBrigada.nuevaCapacidadMaxima(1)

    }
  

}

object reconocimineto {
    method veneficicionDeUnaMision(unaBrigada, unRescatista){
        unRescatista.subirExperiencia(unRescatista.nivelExperiencia() * 1.10)
        unaBrigada.nuevaCapacidadMaxima(0)

    }
  

}