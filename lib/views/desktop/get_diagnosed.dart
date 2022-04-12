import 'package:flutter/material.dart';
import 'package:shayo_med/screens/diagnosis/diagnosis.dart';

class GetDiagnosed extends StatelessWidget {
  final double? theScreenWidth;

  const GetDiagnosed({Key? key, this.theScreenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: DiagnosisProcessScreenOne(
        theScreenWidth: theScreenWidth,
      )),
    );
  }
}
