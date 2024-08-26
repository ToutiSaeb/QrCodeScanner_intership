
abstract class QrState {
  const QrState();
}

class QrInitial extends QrState {}

class QrScanned extends QrState {
  final String result;

  QrScanned(this.result);
}
