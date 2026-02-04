/// Dart - Listas, Iterables y Sets
/// Curso de Flutter por Fernando Herrera
///
/// List: Colección ordenada, permite duplicados, acceso por índice
/// Set: Colección sin duplicados, no tiene orden garantizado
/// Iterable: Clase base, representa algo que se puede recorrer
///
/// Muchos métodos (reversed, where, map) retornan Iterable, no List.
/// Usar .toList() o .toSet() para convertir.
library;

void main() {
  // --- LISTAS ---
  print('=== LISTAS ===\n');

  final pokemons = ['Ditto', 'Pikachu', 'Charmander', 'Squirtle', 'Bulbasaur'];
  print('Lista: $pokemons');
  print('Tipo: ${pokemons.runtimeType}');

  // Propiedades
  print('\nPropiedades:');
  print('length: ${pokemons.length}');
  print('first: ${pokemons.first}');
  print('last: ${pokemons.last}');
  print('isEmpty: ${pokemons.isEmpty}');
  print('Índice [2]: ${pokemons[2]}');

  // Métodos de modificación
  print('\nMétodos de modificación:');
  pokemons.add('Mewtwo');
  print('add: $pokemons');

  pokemons.insert(0, 'Mew');
  print('insert(0): $pokemons');

  pokemons.remove('Ditto');
  print('remove: $pokemons');

  // --- ITERABLES ---
  print('\n=== ITERABLES ===\n');

  final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // reversed retorna Iterable, no List
  final reversed = numbers.reversed;
  print('reversed: $reversed');
  print('Tipo: ${reversed.runtimeType}');
  print('toList(): ${reversed.toList()}');

  // where: filtra elementos
  final mayoresA5 = numbers.where((n) => n > 5);
  print('\nwhere (>5): ${mayoresA5.toList()}');

  // map: transforma elementos
  final dobles = numbers.map((n) => n * 2);
  print('map (*2): ${dobles.toList()}');

  // any y every
  print('\nany (>5): ${numbers.any((n) => n > 5)}');
  print('every (>0): ${numbers.every((n) => n > 0)}');

  // reduce: acumula valores
  final suma = numbers.reduce((a, b) => a + b);
  print('reduce (suma): $suma');

  // --- SETS ---
  print('\n=== SETS ===\n');

  // Set: no permite duplicados
  final pokemonSet = <String>{'Pikachu', 'Ditto', 'Pikachu', 'Charmander'};
  print('Set: $pokemonSet'); // Pikachu solo aparece una vez
  print('Tipo: ${pokemonSet.runtimeType}');

  // Convertir List con duplicados a Set
  final listaDuplicados = [1, 1, 2, 2, 3, 3, 4, 4, 5];
  print('\nLista con duplicados: $listaDuplicados');
  print('toSet(): ${listaDuplicados.toSet()}');

  // Volver a List
  print('toSet().toList(): ${listaDuplicados.toSet().toList()}');
}
