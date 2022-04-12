import 'package:flutter/material.dart';
import 'package:shayo_med/constants/constants.dart';
import 'package:shayo_med/widgets/shayo_text_widget.dart';

class AboutUs extends StatelessWidget {
  final double? theScreenWidth;

  const AboutUs({Key? key, this.theScreenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return //! IMAGE AND TEXT WITH ELEVATED BUTTON
        Container(
            width: double.infinity,
            color: Constants.primaryColour,
            margin: EdgeInsets.symmetric(
              horizontal: theScreenWidth! < 1080
                  ? theScreenWidth! * 0.02
                  : theScreenWidth! * 0.03,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //! IMAGE
                  Expanded(
                    child: SizedBox(
                      height: _screenSize.height * 0.6,
                      width: theScreenWidth! < 1080
                          ? theScreenWidth! * 0.4
                          : theScreenWidth! * 0.5,
                      child: Stack(
                        children: <Widget>[
                          //! TOP RIGHT
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                height: _screenSize.height * 0.3,
                                width: theScreenWidth! < 1080
                                    ? theScreenWidth! * 0.08
                                    : theScreenWidth! * 0.14,
                                color: const Color(0xFF0077B6)),
                          ),

                          //! BOTTOM LEFT
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                height: _screenSize.height * 0.3,
                                width: theScreenWidth! < 1080
                                    ? theScreenWidth! * 0.08
                                    : theScreenWidth! * 0.14,
                                color: Constants.mainColour),
                          ),

                          //! MAIN IMAGE
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: _screenSize.height * 0.58,
                                width: theScreenWidth! < 1080
                                    ? theScreenWidth! * 0.5
                                    : theScreenWidth! * 0.6,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/aboutUs.png"),
                                        fit: BoxFit.contain)),
                              ))
                        ],
                      ),
                    ),
                  ),

                  //! SPACER
                  const SizedBox(
                    width: 20.0,
                  ),

                  //! TEXT
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(21.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //! BUTTON
                            SizedBox(
                              width: theScreenWidth! < 1080
                                  ? theScreenWidth! * 0.18
                                  : theScreenWidth! * 0.12,
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                    color: Constants.primaryColour,
                                    border: Border.all(
                                        width: 1.5,
                                        color: Constants.mainColour)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      ShayoMedTextWidget(
                                          theContent: "About",
                                          fontSize: 16,
                                          fontColour: Constants.mainColour),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "US",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Constants.mainColour,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ]),
                              ),
                            ),

                            const SizedBox(
                              height: 20.0,
                            ),

                            //! TITLE
                            ShayoMedTextWidget(
                                theContent: "BU Med",
                                fontSize: theScreenWidth! < 1080 ? 42 : 65,
                                fontColour: Constants.secondaryColour),

                            const SizedBox(
                              height: 10.0,
                            ),

                            //! SUB TITLE
                            ShayoMedTextWidget(
                                theContent:
                                    "We are a health company that understands the need for immediate medical attention.We provide immediate health diagnosis by certified medical practitioners  from the comfort of your electronic device. ",
                                fontSize: theScreenWidth! < 1080 ? 16 : 21,
                                fontColour: const Color(0xFF474644)),

                            const SizedBox(
                              height: 20.0,
                            ),

                            SizedBox(
                              width: theScreenWidth! < 1080
                                  ? theScreenWidth! * 0.18
                                  : theScreenWidth! * 0.12,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(21.0),
                                    primary: Constants.mainColour,
                                    side: const BorderSide(
                                        width: 1.5,
                                        color: Constants.mainColour)),
                                child: const ShayoMedTextWidget(
                                    theContent: "Read more",
                                    fontSize: 18,
                                    fontColour: Constants.primaryColour),
                              ),
                            ),
                          ],
                        )),
                  ),
                ]));
  }
}
