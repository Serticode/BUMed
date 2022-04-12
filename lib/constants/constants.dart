import 'package:flutter/material.dart';

//! CONSTANTS START HERE
class Constants {
  //! COLOURS
  static const Color primaryColour = Colors.white;
  static const Color mainColour = Color(0XFF023E8A);
  static const Color secondaryColour = Colors.black87;
  static const Color shadowColour = Colors.black38;

  //! TEXT SIZE
  static const double headerTextSize1 = 84.0;
  static const double headerTextSize2 = 72.0;

  static const double subheaderTextSize1 = 32.0;
  static const double subheaderTextSize2 = 28.0;

  static const double bodyTextSize1 = 21.0;
  static const double bodyTextSize2 = 18.0;

  //! ELEVATED BUTTON STYLE
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Constants.mainColour,
    padding: const EdgeInsets.all(21.0),
  );

  //! CONSTANT PATIENT DETAILS
  static const String defaultPatientName = "Ciroma, Chukwuma Adekunle";
  static const String defaultPatientAge = "32";
  static const String defaultPatientEmail = "ciroma@ciroma.com";
  static const String defaultPatientPhoneNo = "+2347012345678";
  static const String defaultPatientWeight = "85KG";
  static const String defaultPatientEthnicity = "Black";
  static const String defaultPatientResult =
      "From symptoms given, Random forest Predicted: Fungal infection \n\nFrom symptoms given, Naive Bayes Predicted: Fungal infection \n\nFrom symptoms given, SVM Predicted: Fungal infection \n\nFrom symptoms given, Ensembled Model Predicted: Fungal infection";

  //!DATE
  static String getTheCurrentDate() {
    var now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String _theDate = (date.day.toString() +
        "/" +
        date.month.toString() +
        "/" +
        date.year.toString());
    return _theDate;
  }

  //! INPUT FIELD DECORATION
  static InputDecoration textFieldDecoration = InputDecoration(
    enabledBorder: const UnderlineInputBorder(),
    focusedBorder: const UnderlineInputBorder(),
    contentPadding: const EdgeInsets.all(21.0),
    focusColor: Constants.mainColour,
    filled: true,
    floatingLabelStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
    labelStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
    hintStyle: const TextStyle(
      fontSize: 14.0,
    ),
  );
}
