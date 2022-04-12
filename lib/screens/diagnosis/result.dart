import 'package:flutter/material.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/main.dart';
import 'package:shayo_med/screens/landing_page/landing_page.dart';
import 'package:shayo_med/widgets/shayo_text_widget.dart';

class DiagnosisResult extends StatelessWidget {
  //final double screenWidth;
  const DiagnosisResult({
    Key? key,
    /* required this.screenWidth */
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: _screenSize.width * 0.8,
          height: _screenSize.height * 0.95,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Constants.mainColour,
              border: Border.all(width: 1.5, color: Constants.mainColour)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //! LEFT SIDE
              //! IMAGE
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //! IMAGE
                    CircleAvatar(
                      radius: 250.0,
                      backgroundColor: const Color(0XFFC4C4C4).withOpacity(0.8),
                      child: const Center(
                        child: CircleAvatar(
                          radius: 248.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage("assets/images/thanks.png"),
                        ),
                      ),
                    ),

                    //! CANCEL BUTTON
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(
                        builder: (_) => const LandingPage(),
                      )),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor:
                            const Color(0XFFC4C4C4).withOpacity(0.3),
                        child: Material(
                          elevation: 30.0,
                          shadowColor: Constants.mainColour.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(200),
                          child: const CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.cancel_outlined,
                              size: 28,
                              color: Constants.mainColour,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //! SPACER
              const SizedBox(
                width: 20.0,
              ),

              //! RIGHT SIDE
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Constants.primaryColour,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "DIAGNOSIS RESULT",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: Constants.mainColour,
                                decorationThickness: 4.0,
                                shadows: [
                                  Shadow(
                                      color: Constants.mainColour,
                                      offset: Offset(0, -15))
                                ],
                              ),
                            ),

                            //! DATE
                            Text(
                              Constants.getTheCurrentDate(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: Constants.mainColour,
                                decorationThickness: 4.0,
                                shadows: [
                                  Shadow(
                                      color: Constants.mainColour,
                                      offset: Offset(0, -15))
                                ],
                              ),
                            ),
                          ],
                        ),

                        //! IMAGE
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 35.0,
                            backgroundColor:
                                const Color(0XFFC4C4C4).withOpacity(0.8),
                            child: const Center(
                              child: CircleAvatar(
                                radius: 33.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("images/logo.png"),
                              ),
                            ),
                          ),
                        ),

                        //! PATIENT DETAILS
                        Container(
                          height: _screenSize.height * 0.2,
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "YOUR DETAILS",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Constants.mainColour,
                                  decorationThickness: 4.0,
                                  shadows: [
                                    Shadow(
                                        color: Constants.mainColour,
                                        offset: Offset(0, -15))
                                  ],
                                ),
                              ),

                              //! NAME & ETHNICITY
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  //! NAME
                                  ShayoMedTextWidget(
                                      theContent: "Full Name: " +
                                          Constants.defaultPatientName,
                                      fontSize: 21.0,
                                      fontColour: Constants.mainColour),

                                  //! ETHNICITY
                                  ShayoMedTextWidget(
                                      theContent: "Ethnicity: " +
                                          Constants.defaultPatientEthnicity,
                                      fontSize: 21.0,
                                      fontColour: Constants.mainColour),
                                ],
                              ),

                              //! AGE & CONTACT
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  //! AGE
                                  ShayoMedTextWidget(
                                      theContent:
                                          "Age: " + Constants.defaultPatientAge,
                                      fontSize: 21.0,
                                      fontColour: Constants.mainColour),

                                  //! CONTACT
                                  ShayoMedTextWidget(
                                      theContent: "Contact number: " +
                                          Constants.defaultPatientPhoneNo,
                                      fontSize: 21.0,
                                      fontColour: Constants.mainColour),
                                ],
                              ),

                              //! EMAIL & WEIGHT
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  //! EMAIL
                                  ShayoMedTextWidget(
                                      theContent: "Email address: " +
                                          Constants.defaultPatientEmail,
                                      fontSize: 21.0,
                                      fontColour: Constants.mainColour),

                                  //! WEIGHT
                                  ShayoMedTextWidget(
                                      theContent: "Weight: " +
                                          Constants.defaultPatientWeight,
                                      fontSize: 21.0,
                                      fontColour: Constants.mainColour),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //! DIAGNOSIS RESULT
                        Container(
                          height: _screenSize.height * 0.5,
                          width: double.infinity,
                          padding: const EdgeInsets.all(
                            32.0,
                          ),
                          margin: const EdgeInsets.symmetric(
                            vertical: 32.0,
                          ),
                          decoration: BoxDecoration(
                              color: Constants.mainColour.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: const Center(
                            child: ShayoMedTextWidget(
                                theContent: Constants.defaultPatientResult,
                                fontSize: 21.0,
                                fontColour: Constants.mainColour),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
