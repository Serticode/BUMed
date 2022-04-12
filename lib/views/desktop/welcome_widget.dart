import 'package:flutter/material.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/views/desktop/get_diagnosed.dart';
import 'package:shayo_med/widgets/shayo_text_widget.dart';

class WelcomeWidget extends StatefulWidget {
  final double? theScreenWidth;

  const WelcomeWidget({Key? key, this.theScreenWidth}) : super(key: key);

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Constants.primaryColour,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: widget.theScreenWidth! < 1080
              ? widget.theScreenWidth! * 0.02
              : widget.theScreenWidth! * 0.03,
        ),
        child: Column(
          children: <Widget>[
            //! UPPER CONTAINER
            Expanded(
                child: SizedBox(
              width: double.infinity,
              child: Row(children: [
                //! TEXT
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(21.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //! TITLE
                            Text(
                              "Your favourite \nOnline clinic",
                              style: TextStyle(
                                  fontSize:
                                      widget.theScreenWidth! < 1080 ? 42 : 65,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  color: Constants.secondaryColour),
                            ),

                            //! SUB TITLE
                            ShayoMedTextWidget(
                                theContent:
                                    "We provide diagnosis for your symptoms \nat anytime of the day without an appointment \nby certified medical practitioners",
                                fontSize:
                                    widget.theScreenWidth! < 1080 ? 16 : 21,
                                fontColour: const Color(0xFF474644)),

                            //! GET STARTED BUTTON
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const GetDiagnosed()));
                                },
                                style: Constants.elevatedButtonStyle
                                    .merge(ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                ))),
                                child: const ShayoMedTextWidget(
                                    theContent: "Get started",
                                    fontSize: 18,
                                    fontColour: Constants.primaryColour)),
                          ],
                        ))),

                //! IMAGE
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(21.0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/homepage_image1.png"),
                          fit: BoxFit.contain)),
                ))
              ]),
            )),

            //! SPACER
            const SizedBox(
              height: 10.0,
            ),

            //! LOWER CONTAINER
            Expanded(
                child: SizedBox(
              width: double.infinity,
              child: Row(children: [
                //! IMAGE
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(21.0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/homepage_image2.png"),
                          fit: BoxFit.contain)),
                )),

                //! TEXT
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(21.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //! TITLE
                            ShayoMedTextWidget(
                                theContent: "Certified & Trusted",
                                fontSize:
                                    widget.theScreenWidth! < 1080 ? 42 : 65,
                                fontColour: Constants.secondaryColour),

                            //! SPACER
                            const SizedBox(
                              height: 38,
                            ),

                            //! SUB TITLE
                            ShayoMedTextWidget(
                                theContent:
                                    "We run a safe 24 hours service, \nwhere you get an instant video \ncall with a doctor.",
                                fontSize:
                                    widget.theScreenWidth! < 1080 ? 16 : 21,
                                fontColour: const Color(0xFF474644)),
                          ],
                        ))),
              ]),
            ))
          ],
        ));
  }
}
