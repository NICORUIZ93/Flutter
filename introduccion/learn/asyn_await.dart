void main() {
  emitNumber().listen((onData) {
    print('$onData');
  });
}

Stream emitNumber() async* {
  final valuesToEmit = [1, 2, 3, 4, 5];
  for (int i in valuesToEmit) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}
