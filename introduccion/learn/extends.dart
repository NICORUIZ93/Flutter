void main() {
  final windPlant = WindPlant(initialEnergy: 100);

  windPlant.consumeEnergy(50);
  print('Energy left: ${windPlant.energyLeft}');
  print(windPlant.type);
  print('wind: ${chargePhone(windPlant)}');
}

double chargePhone(EnergyPlant plan) {
  if (plan.energyLeft < 10) {
    throw Exception('No hay carga');
  }
  return plan.energyLeft - 10;
}

enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {
  double energyLeft;
  final PlantType type; // final porque el tipo no cambia

  EnergyPlant({required this.energyLeft, required this.type});

  void consumeEnergy(double amount);
}

class WindPlant extends EnergyPlant {
  WindPlant({required double initialEnergy})
    : super(energyLeft: initialEnergy, type: PlantType.wind);

  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}
