/// Dart - Hola Mundo
/// Curso de Flutter por Fernando Herrera
///
/// Este es el punto de entrada de toda aplicación Dart.
/// La función main() es obligatoria y es donde inicia la ejecución.
library;

void main() {
  // print() muestra información en la consola
  print('Hola Mundo');

  // Variables y concatenación
  String nombre = 'Nicolas';

  // Concatenación tradicional (no recomendada)
  print('Hola $nombre');

  // Interpolación de strings (recomendada)
  print('Hola $nombre');

  // Interpolación con expresiones
  print('Hola ${nombre.toUpperCase()}');
  print('El nombre tiene ${nombre.length} caracteres');
}
