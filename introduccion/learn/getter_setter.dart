/// Dart - Getters, Setters y Propiedades Privadas
/// Curso de Flutter por Fernando Herrera
///
/// Propiedad privada: Se define con guión bajo _nombrePropiedad
/// Solo es accesible dentro del mismo archivo (library-private).
///
/// Getter: Obtiene el valor de una propiedad
/// Setter: Establece el valor de una propiedad con validación
///
/// Sintaxis:
/// double get area => _lado * _lado;
/// set lado(double value) => _lado = value;
library;

void main() {
  final mySquare = Square(side: 10);

  print('=== Square inicial ===');
  print('Lado: ${mySquare.side}');
  print('Área: ${mySquare.area}');

  // Modificar usando setter
  mySquare.side = 5;
  print('\n=== Después de cambiar lado a 5 ===');
  print('Lado: ${mySquare.side}');
  print('Área: ${mySquare.area}');

  // Intentar valor negativo (setter lo impide)
  print('\n=== Intentando valor negativo ===');
  mySquare.side = -10;
  print('Lado: ${mySquare.side}'); // Sigue siendo 5

  // Ejemplo con perímetro
  print('\n=== Perímetro ===');
  print('Perímetro: ${mySquare.perimeter}');
}

/// Clase Square con getter y setter
class Square {
  // Propiedad privada (guión bajo)
  // Solo accesible dentro de este archivo
  double _side;

  // Constructor con inicialización
  Square({required double side}) : _side = side;

  // GETTER: obtiene el valor del lado
  // Se usa como propiedad: objeto.side
  double get side => _side;

  // SETTER: establece el valor con validación
  // Se usa como propiedad: objeto.side = valor
  set side(double value) {
    if (value < 0) {
      print('Error: El lado no puede ser negativo');
      return;
    }
    _side = value;
  }

  // GETTER calculado: área
  double get area => _side * _side;

  // GETTER calculado: perímetro
  double get perimeter => _side * 4;
}
