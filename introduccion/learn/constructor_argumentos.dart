/// Dart - Constructores con Argumentos Nombrados
/// Curso de Flutter por Fernando Herrera
///
/// Los argumentos nombrados hacen el código más legible.
/// Se definen con {llaves} y se llaman con nombre: valor
///
/// Sintaxis:
/// class Clase {
///   Clase({required this.prop1, this.prop2 = valorDefault});
/// }
///
/// Instanciar:
/// final obj = Clase(prop1: valor, prop2: valor);
library;

void main() {
  // Constructor con argumentos nombrados
  final ironMan = Hero(
    name: 'Tony Stark',
    power: 'Armadura tecnológica',
    isAlive: false,
  );

  print('=== Hero con argumentos nombrados ===');
  print(ironMan);
  print('Nombre: ${ironMan.name}');
  print('Poder: ${ironMan.power}');
  print('¿Vivo?: ${ironMan.isAlive}');

  // Más ejemplos
  final cap = Hero(name: 'Steve Rogers', power: 'Super fuerza', isAlive: true);

  final thor = Hero(name: 'Thor', power: 'Dios del trueno', isAlive: true);

  print('\n=== Avengers ===');
  print(cap);
  print(thor);
}

/// Clase Hero con constructor de argumentos nombrados
class Hero {
  String name;
  String power;
  bool isAlive;

  // Constructor con argumentos nombrados
  // required: obligatorio
  // Se pueden agregar valores por defecto: isAlive = true
  Hero({required this.name, required this.power, required this.isAlive});

  // @override: indica que estamos sobreescribiendo un método de la clase padre
  // toString(): método que se llama cuando convertimos el objeto a String
  @override
  String toString() {
    return '$name - $power - Vivo: $isAlive';
  }
}
