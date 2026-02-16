void main() async {
  print('Inicio del programa');
  try {
    final value = await httpGet('');
    print('Exito $value');
  } on Exception {
    print('Tenemos una excepcion');
  } catch (error) {
    print('Tenemos un error: $error');
  } finally {
    print('Fin del try catch');
  }
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 5));
  // throw Exception('No hay parametros en la pericion');
  throw ('No hay parametros en la pericion');
  //return 'Tenemos un valor en la peticion';
}
