import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressIndicate extends StatelessWidget {
  const ProgressIndicate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitWave(
      color: Color.fromARGB(255, 234, 187, 60),
      size: 20.0,
    ));
  }
}
