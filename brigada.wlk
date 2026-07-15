import recatista.*
import sistemaNacional.*
class Brigadas {
    const grupoDeRecastista = []
    var capacidaMaxima 
    var prioridad = 50

    method grupoDeRecastista()=grupoDeRecastista
    method capacidaMaxima()=capacidaMaxima
    method prioridad()=prioridad

   

   method cantidadDeRecatista(){
    return grupoDeRecastista.size()
   }
   
    method incoporarA(unRecatista){
      if(self.cantidadDeRecatista()> capacidaMaxima)  
      self.error("Se Alcanzó la cantidad másxima de rescatista")
      grupoDeRecastista.add(unRecatista)
    }

    method nuevaCapacidadMaxima(unaCantidad){
        capacidaMaxima = capacidaMaxima + unaCantidad
    }
    // tengo que ver si funciona lo de max y min
    method intialize(){
        prioridad = prioridad.max(0).min(99)
    }

    method capacidaOpertiva(){
        return grupoDeRecastista.sum({r=>r.operatividad()})
    }

    method especialistasEnBusqueda(){
        return grupoDeRecastista.filter({r=>r.esEspecialistaEnBusqueda()})

    }

    method esEspecialisadaEnBusqueda(){
        return grupoDeRecastista.any({r=>r.esEspecialistaEnBusqueda()}) and self.capacidaOpertiva() >= onbr.capacidadOperativa()
    }

    method entrarEnAcción(){
        grupoDeRecastista.forEach({r=>r.realiseUnaMision(self)})

    }

}

