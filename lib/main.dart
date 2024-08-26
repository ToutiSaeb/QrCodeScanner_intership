import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_app/cubit/cubit_cubit.dart';
import 'package:qr_scanner_app/view/scanpage.dart';
import 'package:qr_scanner_app/view/srresult.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QrCubit(),
      child: MaterialApp(
        title: 'QR Code Scanner',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => QrScanPage(),
          '/result': (context) => QrResultPage(),
        },
      ),
    );
  }
}
