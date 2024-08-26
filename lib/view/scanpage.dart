import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_app/cubit/cubit_cubit.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  QRViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
        backgroundColor: Colors.green, 
        elevation: 6.0,
        centerTitle: true,
      ),
      body: QRView(
        key: GlobalKey(debugLabel: 'QR'),
        onQRViewCreated: (QRViewController controller) {
          _controller = controller;
          _controller!.scannedDataStream.listen((scanData) {
            context.read<QrCubit>().scanResult(scanData.code ?? 'Unknown');
            Navigator.pushNamed(context, '/result');
          });
        },
        overlay: QrScannerOverlayShape(
          borderColor: Colors.green, 
          borderRadius: 8,
          borderLength: 20,
          borderWidth: 8,
          cutOutSize: MediaQuery.of(context).size.width * 0.75,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose(); 
    super.dispose();
  }
}
