/// Dart - Maps (Mapas)
/// Curso de Flutter por Fernando Herrera
///
/// Map: Colección de pares clave-valor
/// Similar a objetos en JavaScript o diccionarios en Python.
///
/// Sintaxis:
/// Map<TipoClave, TipoValor> variable = { clave: valor };
///
/// Para valores mixtos usar Map<String, dynamic>
library;

void main() {
  // Map básico
  final Map<String, dynamic> pokemon = {
    'name': 'Ditto',
    'hp': 100,
    'isAlive': true,
    'abilities': <String>['impostor', 'limber'],
    'sprites': {'front': 'ditto/front.png', 'back': 'ditto/back.png'},
  };

  print('Pokemon completo: $pokemon');
  print('Tipo: ${pokemon.runtimeType}');

  // Acceso a valores
  print('\n--- Acceso a valores ---');
  print('Nombre: ${pokemon['name']}');
  print('HP: ${pokemon['hp']}');
  print('Abilities: ${pokemon['abilities']}');
  print('Sprite frontal: ${pokemon['sprites']['front']}');

  // Agregar y modificar
  print('\n--- Agregar y modificar ---');
  pokemon['level'] = 50;
  pokemon['hp'] = 80;
  print('Level agregado: ${pokemon['level']}');
  print('HP modificado: ${pokemon['hp']}');

  // Métodos útiles
  print('\n--- Métodos útiles ---');
  print('Claves: ${pokemon.keys}');
  print('Valores: ${pokemon.values}');
  print('¿Tiene "name"?: ${pokemon.containsKey('name')}');
  print('¿Tiene "evolution"?: ${pokemon.containsKey('evolution')}');

  // Eliminar
  pokemon.remove('isAlive');
  print('Después de remove: ${pokemon.keys}');

  // Recorrer un Map
  print('\n--- Recorrer un Map ---');
  final pokedex = {
    1: 'Bulbasaur',
    4: 'Charmander',
    7: 'Squirtle',
    25: 'Pikachu',
  };

  pokedex.forEach((numero, nombre) {
    print('#$numero - $nombre');
  });
}
