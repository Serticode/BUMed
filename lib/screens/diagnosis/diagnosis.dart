import 'package:flutter/material.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/controllers/diagnosis_controller.dart';
import 'package:shayo_med/screens/diagnosis/result.dart';
import 'package:shayo_med/widgets/shayo_text_widget.dart';

class DiagnosisProcessScreenOne extends StatefulWidget {
  final double? theScreenWidth;
  const DiagnosisProcessScreenOne({Key? key, this.theScreenWidth})
      : super(key: key);

  @override
  State<DiagnosisProcessScreenOne> createState() =>
      _DiagnosisProcessScreenOneState();
}

class _DiagnosisProcessScreenOneState extends State<DiagnosisProcessScreenOne> {
  int ethnicitySelectedIndex = 1;
  int symptomsSelectedIndex = 0;

  //! CONTROLLERS
  final _theNameController = TextEditingController();
  final _theAgeController = TextEditingController();

  //! LISTS
  final List<String> _selectedSymptomsList = [];

  final List<String> _symptoms = [
    "Eye Irritation",
    "Runny Nose",
    "Stuffy Nose",
    "Puffy/ Watery Eyes",
    "Sneezing",
    "Inflamed Nose",
    "Itchy Nose",
    "Itchy Throat",
    "A Runny Nose (Nasal Congestion)",
    "Sore Throat",
    "Chills",
    "General Feeling of Discomfort",
    "Headache",
    "Nausea And Vomiting",
    "Diarrhea",
    "Abdominal Pain",
    "Muscle or Joint Pain",
    "Fatigue",
    "Rapid Breathing",
    "Rapid Heart Rate",
    "Cough",
    "Dehydration",
    "Shortness Of Breath ",
    "Difficulty Breathing",
    "Muscle Aches",
    "Chest Pain",
    "Pink Eye (Conjunctivitis)",
    "Rash",
  ];
  @override
  void dispose() {
    _theNameController.dispose();
    _theAgeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        //! LEFT PART
        Expanded(
            flex: 2,
            child: Container(
              color: Constants.secondaryColour.withOpacity(0.8),
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //! HEADER WITH UNDERLINE
                  const Text(
                    "BRIEF INFORMATION",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: Constants.mainColour,
                      decorationThickness: 7.0,
                      shadows: [
                        Shadow(
                            color: Constants.primaryColour,
                            offset: Offset(0, -15))
                      ],
                    ),
                  ),

                  //! SPACER
                  const SizedBox(
                    height: 30.0,
                  ),

                  //! PATIENT DETAILS
                  SizedBox(
                    height: _screenSize.height * 0.4,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const ShayoMedTextWidget(
                            theContent: Constants.defaultPatientName,
                            fontSize: Constants.bodyTextSize2,
                            fontColour: Constants.primaryColour),
                        Wrap(
                          children: const <Widget>[
                            //! PATIENT AGE
                            ShayoMedTextWidget(
                                theContent:
                                    "\nAge: " + Constants.defaultPatientAge,
                                fontSize: Constants.bodyTextSize2,
                                fontColour: Constants.primaryColour),

                            /* //! PATIENT D.O.B
                            ShayoMedTextWidget(
                                theContent:
                                    "\nD.O.B: " + Constants.defaultPatientDOB,
                                fontSize: Constants.bodyTextSize2,
                                fontColour: Constants.primaryColour), */
                          ],
                        ),
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: _screenSize.height * 0.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/diagnosis2.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),

        //! RIGHT PART
        Expanded(
            flex: 4,
            child: Container(
              color: Constants.primaryColour,
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 21.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //! HEADER WITH UNDERLINE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "SELECT SYMPTOMS",
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

                        //! THE DATE
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

                    Divider(
                      thickness: 2.0,
                      color: Constants.secondaryColour.withOpacity(0.5),
                    ),

                    //! SYMPTOMS SECTION
                    SizedBox(
                      height: _screenSize.height * 0.8,
                      child: //! SYMPTOMS
                          Container(
                              height: _screenSize.height * 0.78,
                              margin: const EdgeInsets.only(top: 21.0),
                              child: SingleChildScrollView(
                                child: Wrap(
                                  spacing: 21,
                                  direction: Axis.horizontal,
                                  children: _symptomsChips(),
                                ),
                              )),
                    ),

                    //! BUTTON AT THE BASE
                    SizedBox(
                      width: _screenSize.width * 0.2,
                      child: ElevatedButton(
                        onPressed: () {
                          DiagnosisController.diagnosePatient(
                              theSymptoms: _selectedSymptomsList);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DiagnosisResult()));
                        },
                        style: Constants.elevatedButtonStyle,
                        child: const ShayoMedTextWidget(
                            theContent: "Diagnose",
                            fontSize: Constants.bodyTextSize2,
                            fontColour: Constants.primaryColour),
                      ),
                    )
                  ]),
            )),
      ],
    );
  }

  //! SYMPTOMS CHIP BUILDER
  List<Widget> _symptomsChips() {
    List<Widget> choiceChips = [];

    //! FOR EACH element IN THE _SYMPTOMS LIST, ADD A NEW CHIP
    // ignore: avoid_function_literals_in_foreach_calls
    _symptoms.forEach((element) {
      choiceChips.add(
        Container(
          height: 60,
          margin: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Constants.primaryColour,
              border: Border.all(
                width: 3.0,
                color: Constants.mainColour,
              )),
          child: ChoiceChip(
            padding: const EdgeInsets.all(18.0),
            label: ShayoMedTextWidget(
                theContent: element,
                fontSize: 18.0,
                fontColour: Constants.secondaryColour),
            backgroundColor: Constants.primaryColour,
            side: BorderSide.none,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            selectedColor: Constants.mainColour.withOpacity(0.5),
            selected: _selectedSymptomsList.contains(element),
            onSelected: (selected) {
              debugPrint(_selectedSymptomsList.length.toString());

              setState(() {
                _selectedSymptomsList.contains(element)
                    ? _selectedSymptomsList.remove(element)
                    : _selectedSymptomsList.add(element);
              });
            },
          ),
        ),
      );
    });

    return choiceChips;
  }
}
