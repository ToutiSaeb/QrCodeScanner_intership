import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_app/cubit/cubit_cubit.dart';
import 'package:qr_scanner_app/cubit/cubit_state.dart';
import 'package:flutter/services.dart'; 

class QrResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Result'),
        backgroundColor: Colors.green,
        elevation: 6.0,
        centerTitle: true,
      ),
      body: BlocBuilder<QrCubit, QrState>(
        builder: (context, state) {
          if (state is QrScanned) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Scan Result:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            state.result,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: state.result));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Link copied to clipboard!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        elevation: 8,
                      ),
                      child: Text(
                        'Copy Link',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<QrCubit>().reset();
                        Navigator.popAndPushNamed(context, '/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        elevation: 8,
                      ),
                      child: Text(
                        'Scan Again',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(child: Text('No Result'));
        },
      ),
    );
  }
}
