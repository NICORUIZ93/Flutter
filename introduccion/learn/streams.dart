void main() {
  emitNumber().listen((onData) {
    print('$onData');
  });
}

Stream<int> emitNumber() {
  return Stream.periodic(Duration(seconds: 1), (value) {
    return value;
  }).take(5);
}
