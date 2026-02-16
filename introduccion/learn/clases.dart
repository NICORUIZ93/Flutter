/// Dart - Clases
/// Curso de Flutter por Fernando Herrera
///
/// Las clases son plantillas para crear objetos.
///
/// Sintaxis básica:
/// class NombreClase {
///   tipo propiedad;
///   NombreClase(this.propiedad);  // Constructor
/// }
///
/// Instanciar:
/// final objeto = NombreClase(valor);
library;

void main() {
  // Crear instancia de Hero
  final wolverine = Hero('Logan', 'Regeneración');

  print('=== Instancia de Hero ===');
  print(wolverine); // Llama a toString() implícitamente
  print('Nombre: ${wolverine.name}');
  print('Poder: ${wolverine.power}');

  // Crear más héroes
  final spiderman = Hero('Peter Parker', 'Telarañas');
  final ironman = Hero('Tony Stark', 'Tecnología');

  print('\n=== Más héroes ===');
  print(spiderman);
  print(ironman);
}

/// Clase Hero con constructor posicional
class Hero {
  String name;
  String power;

  // Constructor con parámetros posicionales
  // this.name asigna el valor directamente a la propiedad
  Hero(this.name, this.power);

  // @override: sobrescribe toString() de Object
  // Sin esto, print(objeto) mostraría: Instance of 'Hero'
  @override
  String toString() {
    return '$name - $power';
  }
}
