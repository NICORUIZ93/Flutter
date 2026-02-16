/// Dart - Asserts (Aserciones)
/// Curso de Flutter por Fernando Herrera
///
/// assert(): Verifica una condición durante el desarrollo.
/// Si la condición es false, lanza un error.
///
/// ⚠️ IMPORTANTE:
/// - Solo funcionan en modo DEBUG
/// - En producción (release) se ignoran
/// - Útiles para validar datos durante desarrollo
///
/// Sintaxis:
/// assert(condicion, 'mensaje de error');
library;

void main() {
  // Assert valida que side >= 0
  final mySquare = Square(side: 5);

  print('=== Square con assert ===');
  print('Lado: ${mySquare.side}');
  print('Área: ${mySquare.area}');

  // Esto lanzaría error en modo debug:
  // final invalid = Square(side: -5);
  // AssertionError: El lado debe ser mayor o igual a 0

  // Más ejemplos
  print('\n=== Más ejemplos ===');
  final bigSquare = Square(side: 100);
  print('Lado: ${bigSquare.side}, Área: ${bigSquare.area}');

  final smallSquare = Square(side: 0.5);
  print('Lado: ${smallSquare.side}, Área: ${smallSquare.area}');
}

/// Clase Square con assert en constructor
class Square {
  double _side;

  // Constructor con assert
  // assert verifica la condición ANTES de asignar el valor
  // Si side < 0, lanza AssertionError (solo en debug)
  Square({required double side})
    : assert(side >= 0, 'El lado debe ser mayor o igual a 0'),
      _side = side;

  // Getter para el lado
  double get side => _side;

  // Setter con validación
  set side(double value) {
    assert(value >= 0, 'El lado debe ser mayor o igual a 0');
    _side = value;
  }

  // Getter calculado para el área
  double get area => _side * _side;
}
