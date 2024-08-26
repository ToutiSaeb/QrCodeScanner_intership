import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_app/cubit/cubit_state.dart';



class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial());

  void scanResult(String result) {
    emit(QrScanned(result));
  }

  void reset() {
    emit(QrInitial());
  }
}
