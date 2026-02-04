/// Dart - Tipos de Variables
/// Curso de Flutter por Fernando Herrera
///
/// Dart es un lenguaje fuertemente tipado con inferencia de tipos.
///
/// Tipos básicos:
/// - String  : Cadenas de texto
/// - int     : Números enteros
/// - double  : Números con decimales
/// - bool    : true / false
/// - List    : Colección ordenada (arreglos)
/// - Map     : Clave-valor (objetos)
///
/// Modificadores:
/// - var   : Dart infiere el tipo, puede cambiar el valor
/// - final : Se asigna una vez (runtime)
/// - const : Constante en tiempo de compilación
/// - late  : Inicialización tardía
library;

void main() {
  // Tipos básicos
  final String pokemon = 'Ditto';
  final int hp = 100;
  final double peso = 4.0;
  final bool isAlive = true;
  final List<String> abilities = ['impostor', 'limber'];
  final sprites = <String>['ditto/front.png', 'ditto/back.png'];

  print("""
  Pokemon : $pokemon
  HP      : $hp
  Peso    : $peso kg
  Vivo    : $isAlive
  Abilities: $abilities
  Sprites : $sprites
  """);

  // Ver el tipo de las variables con runtimeType
  print('--- Tipos de las variables ---');
  print('pokemon   -> ${pokemon.runtimeType}');
  print('hp        -> ${hp.runtimeType}');
  print('peso      -> ${peso.runtimeType}');
  print('isAlive   -> ${isAlive.runtimeType}');
  print('abilities -> ${abilities.runtimeType}');

  // Diferencia entre var, final y const
  print('\n--- var vs final vs const ---');

  // var: puede cambiar
  var pokemonVar = 'Pikachu';
  pokemonVar = 'Raichu'; // OK
  print('var: $pokemonVar');

  // final: se asigna una vez (en runtime)
  final pokemonFinal = 'Charmander';
  // pokemonFinal = 'Charmeleon'; // ERROR
  print('final: $pokemonFinal');

  // const: constante en tiempo de compilación
  const pokemonConst = 'Bulbasaur';
  // const ahora = DateTime.now(); // ERROR: no se conoce en compilación
  print('const: $pokemonConst');
}
