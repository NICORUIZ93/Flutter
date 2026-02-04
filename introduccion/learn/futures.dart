void main() {
  print('Inicio del programa');
  httpGet()
      .then((onValue) {
        print(onValue);
      })
      .catchError((onError) {
        print(onError);
      });
  print('Fin del programa');
}

Future<String> httpGet() {
  return Future.delayed(Duration(seconds: 5), () {
    throw 'Error en la peticion HTTP';
    return 'RESPUESTA PETICION HTTP';
  });
}
