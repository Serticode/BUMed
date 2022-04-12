import 'package:flutter/material.dart';

class DiagnosisController {
  //! THE DIAGNOSIS METHOD CALLER
  static diagnosePatient(
      {required List<String> theSymptoms,
      String? thePatientName,
      String? thePatientAge}) {
    String theSymptomsByComma = "";
    theSymptoms.forEach(
        (element) => theSymptomsByComma = theSymptomsByComma + element + ",");

    debugPrint(theSymptomsByComma);
  }
}
