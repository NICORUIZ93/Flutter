/// Dart - Override y Valores por Defecto
/// Curso de Flutter por Fernando Herrera
///
/// @override: Anotación que indica que estamos sobreescribiendo
/// un método de la clase padre (Object).
///
/// Valores por defecto en constructores:
/// Hero({this.power = 'sin poder'})
/// Si no se proporciona valor, usa el default.
library;

void main() {
  // Hero con valor por defecto
  final wolverine = Hero(name: 'Logan');

  print('=== Hero con valor por defecto ===');
  print(wolverine);
  print('Nombre: ${wolverine.name}');
  print('Poder: ${wolverine.power}'); // Usa valor por defecto

  // Hero proporcionando todos los valores
  final batman = Hero(name: 'Bruce Wayne', power: 'Inteligencia y dinero');

  print('\n=== Hero con poder personalizado ===');
  print(batman);
  print('Nombre: ${batman.name}');
  print('Poder: ${batman.power}');

  // Más ejemplos
  print('\n=== Más héroes ===');
  final hulk = Hero(name: 'Bruce Banner', power: 'Super fuerza');
  final antman = Hero(name: 'Scott Lang'); // Sin poder específico

  print(hulk);
  print(antman);
}

/// Clase Hero con valor por defecto en constructor
class Hero {
  String name;
  String power;

  // Constructor con valor por defecto
  // Si no se proporciona power, usa 'Sin poder'
  Hero({required this.name, this.power = 'Sin poder'});

  /// @override sobrescribe el método toString() de Object
  /// Sin esto, print(objeto) mostraría: Instance of 'Hero'
  /// Con esto, mostramos una representación personalizada
  @override
  String toString() {
    return '$name - $power';
  }
}
