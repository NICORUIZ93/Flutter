/// Dart - Funciones
/// Curso de Flutter por Fernando Herrera
///
/// Sintaxis básica:
/// tipoRetorno nombreFuncion(parametros) {
///   return valor;
/// }
///
/// Tipos de parámetros:
/// - Obligatorios: (int a, int b)
/// - Opcionales posicionales: (int a, [int b = 0])
/// - Opcionales nombrados: ({int a = 0, int b = 0})
/// - Requeridos nombrados: ({required int a})
///
/// Función flecha (arrow function):
/// int suma(int a, int b) => a + b;
library;

void main() {
  print('=== Funciones básicas ===\n');
  saludar();
  print(greetEveryone());
  print('Suma: ${addTwoNumbers(10, 20)}');

  print('\n=== Función flecha ===\n');
  print('Multiplicar: ${multiply(5, 3)}');

  print('\n=== Parámetros opcionales posicionales ===\n');
  // Se definen con [corchetes]
  print(greetPokemon('Pikachu'));
  print(greetPokemon('Pikachu', 'Hola'));

  print('\n=== Parámetros opcionales nombrados ===\n');
  // Se definen con {llaves}
  print(createPokemon(name: 'Ditto'));
  print(createPokemon(name: 'Pikachu', hp: 100));
  print(createPokemon(name: 'Charmander', hp: 80, type: 'Fire'));

  print('\n=== Parámetros requeridos nombrados ===\n');
  // required hace el parámetro obligatorio
  print('División: ${divide(dividend: 10, divisor: 2)}');

  print('\n=== Funciones como argumentos ===\n');
  final pokemons = ['Ditto', 'Pikachu', 'Charmander'];

  // forEach con función anónima
  for (var pokemon in pokemons) {
    print('Pokemon: $pokemon');
  }

  // forEach con función flecha
  print('');
  for (var p in pokemons) {
    print('-> $p');
  }

  print('\n=== Funciones que retornan funciones ===\n');
  // Closures
  final multiplicarPor2 = createMultiplier(2);
  final multiplicarPor5 = createMultiplier(5);

  print('10 x 2 = ${multiplicarPor2(10)}');
  print('10 x 5 = ${multiplicarPor5(10)}');
}

// --- DEFINICIÓN DE FUNCIONES ---

// Función sin retorno
void saludar() {
  print('Hola Mundo');
}

// Función con retorno
String greetEveryone() {
  return 'Hola a todos!';
}

// Función con parámetros obligatorios
int addTwoNumbers(int a, int b) {
  return a + b;
}

// Función flecha (una sola expresión)
int multiply(int a, int b) => a * b;

// Parámetros opcionales posicionales [corchetes]
String greetPokemon(String name, [String greeting = 'Buenos días']) {
  return '$greeting, $name!';
}

// Parámetros opcionales nombrados {llaves}
String createPokemon({
  required String name, // obligatorio
  int hp = 100, // opcional con valor por defecto
  String? type, // opcional nullable
}) {
  var info = 'Pokemon: $name, HP: $hp';
  if (type != null) info += ', Type: $type';
  return info;
}

// Parámetros requeridos nombrados
double divide({required double dividend, required double divisor}) {
  if (divisor == 0) return 0;
  return dividend / divisor;
}

// Función que retorna función (Closure)
Function createMultiplier(int factor) {
  return (int value) => value * factor;
}
