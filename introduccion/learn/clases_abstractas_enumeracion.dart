/// Dart - Clases Abstractas y Enumeraciones
/// Curso de Flutter por Fernando Herrera
///
/// Clase Abstracta:
/// - No se puede instanciar directamente
/// - Define métodos que las clases hijas DEBEN implementar
/// - Sirve como "contrato" o plantilla
///
/// Enum (Enumeración):
/// - Define un conjunto fijo de valores constantes
/// - Útil para representar estados, tipos, categorías
///
/// Sintaxis:
/// enum MiEnum { valor1, valor2, valor3 }
/// abstract class MiClase { void metodo(); }
library;

void main() {
  print('=== Enumeraciones ===\n');

  // Usar enum
  final planta1 = WindPlant(energyLeft: 100);
  final planta2 = NuclearPlant(energyLeft: 1000);

  print('Planta eólica:');
  print('  Tipo: ${planta1.type}');
  print('  Energía: ${planta1.energyLeft}');

  print('\nPlanta nuclear:');
  print('  Tipo: ${planta2.type}');
  print('  Energía: ${planta2.energyLeft}');

  // Consumir energía
  print('\n=== Consumiendo energía ===\n');

  planta1.consumeEnergy(50);
  print('Eólica después de consumir 50: ${planta1.energyLeft}');

  planta2.consumeEnergy(200);
  print('Nuclear después de consumir 200: ${planta2.energyLeft}');

  // Listar todos los valores del enum
  print('\n=== Todos los tipos de planta ===');
  for (final type in PlantType.values) {
    print('- $type');
  }

  // Acceder por índice
  print('\n=== Acceso por índice ===');
  print('PlantType.values[0]: ${PlantType.values[0]}');
  print('PlantType.nuclear.index: ${PlantType.nuclear.index}');
  print('PlantType.wind.name: ${PlantType.wind.name}');
}

/// Enum: Define tipos de planta de energía
/// Los valores son constantes en tiempo de compilación
enum PlantType { nuclear, wind, water }

/// Clase Abstracta: Define el contrato para plantas de energía
/// No se puede instanciar: final planta = EnergyPlant(); // ERROR
/// Las clases hijas DEBEN implementar consumeEnergy()
abstract class EnergyPlant {
  double energyLeft;
  final PlantType type; // final porque el tipo no cambia

  EnergyPlant({required this.energyLeft, required this.type});

  /// Método abstracto: sin implementación
  /// Las clases hijas DEBEN implementarlo
  void consumeEnergy(double amount);
}

/// Clase concreta: Implementa EnergyPlant
/// Planta de energía eólica
class WindPlant extends EnergyPlant {
  WindPlant({required super.energyLeft}) : super(type: PlantType.wind);

  /// Implementación obligatoria del método abstracto
  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}

/// Clase concreta: Planta de energía nuclear
class NuclearPlant extends EnergyPlant {
  NuclearPlant({required super.energyLeft}) : super(type: PlantType.nuclear);

  @override
  void consumeEnergy(double amount) {
    // Las plantas nucleares son más eficientes
    energyLeft -= (amount * 0.5);
  }
}

/// Clase concreta: Planta hidroeléctrica
class WaterPlant extends EnergyPlant {
  WaterPlant({required super.energyLeft}) : super(type: PlantType.water);

  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}
