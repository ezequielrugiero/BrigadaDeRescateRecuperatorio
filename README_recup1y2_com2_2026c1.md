# **Recuperatorios \- Comisión 2**

# **Programación con Objetos 1 UNAHUR \- 2026C1**
---
## **Criterio de evaluación**

**Se evaluará su solución prestando especial atención a:**

Pautas obligatorias (descritas abajo) correctamente cumplidas.

Entendimiento y correcta aplicación de los conceptos vistos en la cursada: Objeto, mensaje, polimorfismo, colecciones, bloques, referencias, clases, herencia y tests unitarios.

Correcto uso de recursos del lenguaje, como el atajo property y los métodos predefinidos disponibles para los distintos tipos de objetos.

Prolijidad y legibilidad del código presentado.

## **Sistema Nacional de Rescate**

**Nota importante**: para quienes deban recuperar solo el 1er parcial, pueden modelar 1 sola brigada como un objeto autodefinido, y 1 solo objeto por cada tipo de rescatista, respetando lo que se pide en el dominio (aunque haya que repetir atributos y métodos), o pueden optar por hacerlo como clases, en cuyo caso deben respetar siempre las reglas de cada elemento y si aplican herencia hacerlo correctamente (herencia, clase abstracta, etc)

### **Común a todxs**

Ante una catástrofe de gran magnitud, el Organismo Nacional de Brigadas de Rescate organiza brigadas que intervienen en distintas zonas afectadas con el objetivo de realizar principalmente búsqueda y rescate de víctimas. En este dominio nos interesa modelar solamente una parte de las funciones del organismo y la conformación de las brigadas de rescate y sus integrantes, para conocer los efectos que produce en estos al ponerse en acción. Queda fuera de alcance los detalles de cada misión de rescate y las zonas afectadas. 

### Brigadas

Una brigada está integrada por un conjunto de rescatistas donde cada uno tiene un rol (le llamaremos misión) y colaboran entre sí para localizar víctimas, brindar asistencia y evaluar el estado de la zona.

De cada brigada interesa conocer su capacidad máxima de integrantes (un valor entre 2 y 10) y el nivel de prioridad que tiene asignado, que no cambia y por defecto es 50 pero puede ser distinto para diferentes brigadas. La prioridad permite determinar que brigada será convocada primero cuando ocurran nuevas emergencias y es un valor entre 0 y 99 (**menor valor, mayor prioridad**)

Una brigada puede incorporar nuevos rescatistas siempre que no supere su capacidad máxima. Si se intenta agregar un rescatista cuando ya alcanzó dicho límite debe producirse el error **"Se alcanzó la cantidad máxima de rescatistas permitida."**

Cada brigada puede responder su **capacidad operativa**, obtenida a partir de la suma de la capacidad operativa de todos sus rescatistas; la lista de **especialistas en búsqueda** que posee; y si se encuentra **especializada en búsquedas**. Una brigada se considera especializada en búsquedas cuando posee al menos un especialista en búsqueda y su capacidad operativa supera el mínimo definido por el Organismo Nacional de Brigadas de Rescate (ONBR) que puede ser modificado por dicho organismo en cualquier momento y arranca en 50\. También se le debe poder indicar a una brigada que entre en acción, lo que hará que todos sus rescatistas cumplan la misión con las consecuencias correspondientes a la brigada y a los rescatistas.

### Rescatistas:

Los rescatistas registran su nivel de experiencia (que es un valor entre 1 y 10, por defecto es 1) y la misión (rol) que tienen asignada. Si no se indica ninguna, es asistencia el rol por defecto. Las misiones posibles son **búsqueda**, **asistencia** y **reconocimiento**, pudiendo cambiar de misión en cualquier momento. 

De cualquier rescatista interesa conocer su **capacidad operativa**, si es **especialista en búsqueda** y poder indicarle que realice una misión. La capacidad operativa base de cualquier rescatista es igual a su experiencia multiplicada por cinco. Cada vez que ejecuta una misión (se lo indica la brigada a la que pertenece siempre), cada rol le otorga un valor distinto que hace incrementar su experiencia, y también dependiendo del rol le puede sumar a esa brigada un valor a su capacidad máxima de integrantes según el siguiente detalle: 

Las misiones de búsqueda otorgan un 25% de experiencia al rescatista y le suman a la brigada 2 a su capacidad máxima. Las de asistencia dan 15% de experiencia y suman 1 a la capacidad máxima de la brigada. Las de reconocimiento, le dan 10% de experiencia al rescatista y no hacen aumentar la capacidad máxima de la brigada.

### Rescatistas Humanos 

Los rescatistas humanos registran además la cantidad de capacitaciones realizadas (inician en cero). Su capacidad operativa se calcula como la capacidad base más cinco unidades por cada capacitación. Cada vez que realiza una misión, además de lo indicado para todos los rescatistas, incrementa en una unidad su cantidad de capacitaciones. Puede tener asignada misión de búsqueda pero es especialista en búsqueda solo cuando tiene asignada una misión de búsqueda y posee al menos 3 capacitaciones.

### Perros de Rescate
Los perros de rescate registran su nivel de entrenamiento, inicia en 1\. Su capacidad operativa es la base \+ 3 unidades por cada nivel de entrenamiento. Puede tener asignada cualquier misión, pero siempre son considerados especialistas en búsqueda. Cada misión incrementa también en 3 unidades su nivel de entrenamiento.

---
### Solo para quienes deban recuperar 2do parcial

### Rescatistas autónomos
De los rescatistas autónomos se conoce su nivel de energía (inicia en 100, que disminuye con el uso y nunca puede ser negativo ni mayor a 100). Su capacidad operativa se obtiene sumando dicho nivel de energía a la capacidad base y en cada misión consumen energía dependiendo del tipo de autónomo que sea. También tienen la capacidad de recargarse al 100%.

Actualmente existen dos tipos de rescatistas autónomos: androides de rescate y drones de rescate.

### Rescatistas Androides
Los androides de rescate son especialistas en tareas de asistencia independientemente de la misión asignada. Cada misión además de lo común a todos los rescatistas, le consume 20 unidades de energía. Solo son especialistas en búsqueda cuando conservan al menos 60 unidades de energía.

### Drones Rescatistas
Los drones de rescate registran la altura máxima de vuelo que pueden alcanzar que es un valor fijo. Para calcular su capacidad operativa se le suma un 25% de la altura máxima que puede alcanzar al valor de capacidad operativa. Cada misión además reduce su energía en un diez por ciento. Si bien se les puede asignar cualquier misión como a cualquier rescatista, estos drones siempre ejecutan misiones de reconocimiento, es decir, por más que se les asigne cualquier misión siempre se auto configuran con misión de reconocimiento y nunca son especialistas en búsqueda.

---
### Test Iniciales (Parte 1) - obligatorio para todxs

Considere la brigada Cóndor, con prioridad 50 y capacidad máxima para 3 rescatistas, integrada por:

- Ana: una rescatista humana con misión de búsqueda y 2 capacitaciones.  
- Bruno: un rescatista humano con misión de asistencia.  
- Rex: un perro de rescate con nivel de entrenamiento 4\.

Verificar que:

1. La capacidad operativa de la brigada es 37.  
2. La brigada posee 1 especialista en búsqueda.  
3. Cambiar la capacidad mínima del onbr a 70, la brigada deja de estar especializada en búsquedas.  
4. Indicar a la brigada que entre en acción, y verificar que posee 2 especialistas en búsqueda.  
5. Luego de que entra en acción verificar que la capacidad máxima de la brigada pasó a ser 7.
---
### Solo para quienes deban recuperar 2do parcial

El Sistema Nacional del ONBR administra todas las brigadas registradas, puede agregar brigadas existentes y tiene la capacidad de crear nuevas brigadas agregándolas directamente a su registro de brigadas. Toda nueva brigada comienza con prioridad 50 y una capacidad máxima igual a la cantidad de brigadas especializadas en búsquedas que haya actualmente; si no hay al menos 2 especializadas, se crea con capacidad para 2 integrantes. Al crearse la nueva brigada se incorpora automáticamente un rescatista Humano y un Perro de rescate con los valores por defecto y se agrega la brigada nueva en la colección de brigadas del ONBR. También se le debe poder pedir al sistema la última brigada agregada, la de mayor prioridad y que accionen en una emergencia todas las brigadas, eso provoca que entren todas en acción.

**Test Finales (Parte 2\)**

Considere además las siguientes brigadas:

Brigada Norte, integrada por un androide de rescate.  
Brigada Sur, integrada por un dron de rescate.

Verifique que:

- Al indicar al ONBR que accione en una emergencia, el androide consume 20 unidades de energía y el dron reduce su energía un 10%.  
- Al solicitar al ONBR la creación de una nueva brigada, ésta tiene prioridad 50, capacidad máxima 2 y queda integrada por un Humano y un Perro de rescate con los valores por defecto.