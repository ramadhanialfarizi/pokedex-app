import 'package:flutter/material.dart';

class FailLoadDataScreen extends StatelessWidget {
  const FailLoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Column(
              children: [
                Image.asset('assets/something_wrong.png'),
                const Text(
                  'Please check your connection before \n entry the app :)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
