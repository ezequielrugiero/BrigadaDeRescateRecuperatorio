import brigada.*
import recatista.*
object onbr {
    var capacidadOperativa = 50
    const registroDeBrigadas = []


    method registroDeBrigadas()=registroDeBrigadas
    method capacidadOperativa()=capacidadOperativa

    method nuevaCapacidadOperativa(unaCantidad){
        capacidadOperativa = unaCantidad
    }

    method registrAUnaNueva(brigada){
        registroDeBrigadas.add(brigada)
    }

    method quitarA(unaBrigada){
        registroDeBrigadas.remove(unaBrigada)
    }

    method crearUnaBrigada(){
       const nuevaBrigada = new Brigadas(capacidaMaxima = self.capacidadMaximahabilitada(),
       grupoDeRecastista = [new Humanos(), new Perros()] )
       self.registrAUnaNueva(nuevaBrigada)
    }

    
    method capacidadMaximahabilitada(){
        if(registroDeBrigadas.any({b=>b.esEspecialisadaEnBusqueda()})){
             // el metodo count cuenta cuantos objetos cumplete con dicha condicion, dentro de la lista 
             // y te devuelve la cantidad.-
             return registroDeBrigadas.count({b=>b.esEspecialisadaEnBusqueda()})
        } else { return 2  }
    }

    method laUltimaBrigada(){
        return registroDeBrigadas.last()
    }
    // este metodod tranforma toda lista en la prioridad que son numero, 
    // para luego ver cual numero es el más alto
    // para despues devolverme el objeto que le pertenesta ese numero, que este caso es su prioridad.
    method laBrigadaConMayorPrioridad(){
        return registroDeBrigadas.max({b=>b.prioridad()})
    }

    // este methodo llama al metodo entrarEnAccion De cada brigada, el cual termina llamando al mentodo
    // realizar una mision de canda rescatista, termina siendo un accion en cadena. 
    method accionarEmergencia(){
        registroDeBrigadas.forEach({b=>b.entrarEnAcción()})
    }
}