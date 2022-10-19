"""
El patron de diseno singleton (instancia unica) esta disenado para restringir la creacion de objetos pertenecientes a una clase o el valor de un tipo a un unico objeto.
Su intencion consiste en garantizar que una clase solo tenga una instancia y proporcionar un punto de acceso global a ella.
El patron singleton se implementa creando en nuestra clase un metodo que crea una instancia del objeto solo si todavia no existe alguna. Para asegurar que la clase no puede ser instanciada nuevamente se regula el alcance del constructor (con atributos como protegido o privado).
La instrumentacion del patron puede ser delicada en programas con multiples hilos de ejecucion. Si dos hilos de ejecucion intentan crear la instancia al mismo tiempo y esta no existe todavia, solo uno de ellos debe lograr crear el objeto. La solucion clasica para este problema es utilizar exclusion mutua en el metodo de creacion de la clase que implementa el patron.
Las situaciones mas habituales de aplicacion de este patron son aquellas en las que dicha clase controla el acceso a un recurso fisico unico (como puede ser el raton o un archivo abierto en modo exclusivo) o cuando cierto tipo de datos debe estar disponible para todos los demas objetos de la aplicacion.
El patron singleton provee una unica instancia global gracias a que:
    La propia clase es responsable de crear la unica instancia.
    Permite el acceso global a dicha instancia mediante un metodo de clase.
    Declara el constructor de clase como privado para que no sea instanciable directamente.
"""
class Singleton (object):
    instance = None
    def __new__(cls, *args, **kargs):
        if cls.instance is None:
            cls.instance = object.__new__(cls, *args, **kargs)
        return cls.instance

#Usage
mySingleton1 = Singleton()
mySingleton2 = Singleton()

#mySingleton1 y mySingleton2 son la misma instancia
assert mySingleton1 is mySingleton2
