void main() async {
  print('Inicio del programa');
  try {
    final value = await httpGet('');
    print(value);
    print('Fin del programa');
  } catch (error) {
    print(error);
  }
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 5));
  throw 'Error en la peticion';
  return 'Tenemos un valor en la peticion';
}
