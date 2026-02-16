/// Dart - Tipo Dynamic
/// Curso de Flutter por Fernando Herrera
///
/// dynamic: Variable que puede cambiar de tipo en cualquier momento.
///
/// ⚠️ CUIDADO: Evitar su uso cuando sea posible.
/// Dart no puede verificar errores en tiempo de compilación.
///
/// ¿Cuándo usarlo?
/// - Respuestas de APIs (JSON)
/// - Datos cuyo tipo no conocemos
library;

void main() {
  // dynamic puede ser cualquier cosa
  dynamic errorMessage = 'Hola';
  print('errorMessage: $errorMessage (${errorMessage.runtimeType})');

  errorMessage = 123;
  print('errorMessage: $errorMessage (${errorMessage.runtimeType})');

  errorMessage = [1, 2, 3];
  print('errorMessage: $errorMessage (${errorMessage.runtimeType})');

  errorMessage = {'name': 'Ditto'};
  print('errorMessage: $errorMessage (${errorMessage.runtimeType})');

  errorMessage = true;
  print('errorMessage: $errorMessage (${errorMessage.runtimeType})');

  // Comparación: dynamic vs var vs Object
  print('\n--- dynamic vs var vs Object ---');

  // dynamic: cambia de tipo libremente
  dynamic d = 'texto';
  d = 100; // OK
  print('dynamic: $d');

  // var: Dart infiere el tipo, NO puede cambiar
  var v = 'texto';
  // v = 100; // ERROR: v es String
  print('var: $v (inferido como ${v.runtimeType})');

  // Object: puede contener cualquier cosa pero no accede a métodos específicos
  Object o = 'texto';
  o = 100; // OK
  // print(o.isEven); // ERROR: Object no tiene isEven
  print('Object: $o');
}
